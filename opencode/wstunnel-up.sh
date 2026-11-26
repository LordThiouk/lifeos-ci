#!/usr/bin/env bash
# Démarre un proxy HTTP local via wstunnel (WebSocket) vers un serveur distant.
# Usage :
#   OPENCODE_WSTUNNEL_URL=wss://host bash wstunnel-up.sh
#   → imprime sur stdout l'URL http://127.0.0.1:PORT à passer en HTTPS_PROXY.
#
# Pourquoi : un proxy HTTP CONNECT via bore.pub depuis les runners GitHub
# établit le TCP mais le stream LLM reste muet ; le tunnel WS contourne ça.
set -euo pipefail

url="${OPENCODE_WSTUNNEL_URL:-}"
[ -n "$url" ] || { echo "wstunnel-up: OPENCODE_WSTUNNEL_URL vide" >&2; exit 2; }
case "$url" in
  ws://*|wss://*|http://*|https://*) ;;
  *)
    echo "wstunnel-up: URL invalide (ws[s]|http[s]:// attendu)" >&2
    exit 2
    ;;
esac

ver="${WSTUNNEL_VERSION:-10.1.9}"
# SHA256 du tarball linux_amd64 v10.1.9 (releaser erebe/wstunnel).
sha_amd64="${WSTUNNEL_SHA256_AMD64:-d4c6178e7e7756a49386ba6f419345da4b8b53996390100cfafb2323fc853fbb}"
# arm64 : laisser vide → skip pin (CI runners = amd64).
sha_arm64="${WSTUNNEL_SHA256_ARM64:-}"

arch="$(uname -m)"
case "$arch" in
  x86_64|amd64) asset="wstunnel_${ver}_linux_amd64.tar.gz"; expect_sha="$sha_amd64" ;;
  aarch64|arm64) asset="wstunnel_${ver}_linux_arm64.tar.gz"; expect_sha="$sha_arm64" ;;
  *)
    echo "wstunnel-up: arch non supportée : $arch" >&2
    exit 2
    ;;
esac

keep="${RUNNER_TEMP:-/tmp}/wstunnel-bin"
mkdir -p "$keep"
tgz="$keep/$asset"
curl -fsSL --retry 3 --retry-delay 2 \
  -o "$tgz" \
  "https://github.com/erebe/wstunnel/releases/download/v${ver}/${asset}"
if [ -n "$expect_sha" ]; then
  echo "$expect_sha  $tgz" | sha256sum -c - >/dev/null
fi
tar -xzf "$tgz" -C "$keep"
bin="$keep/wstunnel"
chmod 0755 "$bin"
[ -x "$bin" ] || { echo "wstunnel-up: binaire absent après extract" >&2; exit 1; }

port="$(python3 -c 'import socket; s=socket.socket(); s.bind(("127.0.0.1",0)); print(s.getsockname()[1]); s.close()')"
proxy="http://127.0.0.1:${port}"
log="${RUNNER_TEMP:-/tmp}/wstunnel-client.log"

# Détacher du job shell pour survivre au script.
nohup "$bin" client -L "http://127.0.0.1:${port}" "$url" \
  >"$log" 2>&1 &
echo $! >"${RUNNER_TEMP:-/tmp}/wstunnel-client.pid"

ok=0
for _ in $(seq 1 40); do
  if python3 -c "import socket,sys; s=socket.socket(); s.settimeout(0.3); s.connect(('127.0.0.1', int(sys.argv[1])))" "$port" 2>/dev/null; then
    ok=1
    break
  fi
  sleep 0.25
done
if [ "$ok" != 1 ]; then
  echo "wstunnel-up: proxy local non prêt (voir $log)" >&2
  tail -n 40 "$log" >&2 || true
  exit 1
fi

printf '%s\n' "$proxy"
