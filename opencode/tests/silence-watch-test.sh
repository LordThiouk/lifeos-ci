#!/usr/bin/env bash
# Coupe un processus muet après N s sans croissance du journal.
#   opencode/tests/silence-watch-test.sh
set -euo pipefail
here=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
# shellcheck source=opencode/tests/lib.sh
. "$here/tests/lib.sh"

SW="$here/silence-watch.sh"
[ -x "$SW" ] || ko "silence-watch.sh manquant ou non exécutable"

T=$(mktemp -d)
trap 'rm -rf "$T"; kill "$victim" 2>/dev/null || true; kill "$watch" 2>/dev/null || true' EXIT

log="$T/out.log"
pidf="$T/oc.pid"
flag="$T/silence.flag"
live="$T/live.log"
: > "$log"

# Victime : processus long qui n'écrit rien après un banner.
# $$ dans ( ) reste le PID du script parent — utiliser BASHPID.
(
  echo "$BASHPID" > "$pidf"
  printf 'banner\n' >> "$log"
  sleep 120
) &
victim=$!

start=$(date +%s)
bash "$SW" \
  --log "$log" \
  --pid-file "$pidf" \
  --flag "$flag" \
  --live-log "$live" \
  --sec 5 \
  --poll 1 \
  --grace 1 &
watch=$!
wait "$watch"
elapsed=$(( $(date +%s) - start ))

[ -f "$flag" ] || ko "flag silence absent après stagnation"
# Doit couper bien avant les 120 s de sleep.
[ "$elapsed" -lt 40 ] || ko "coupure trop lente (${elapsed}s)"
# La victime doit être morte (ou mourante).
sleep 1
if kill -0 "$victim" 2>/dev/null; then
  ko "processus victime encore vivant après silence-watch"
fi
grep -q 'Silence 5s' "$live" || ko "message silence absent du live-log"

ok "silence-watch coupe un processus muet en <40s (elapsed=${elapsed}s)"
echo "PASS silence-watch"
