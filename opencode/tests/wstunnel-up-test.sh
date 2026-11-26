#!/usr/bin/env bash
# Tests locaux (sans réseau) pour opencode/wstunnel-up.sh
#   bash opencode/tests/wstunnel-up-test.sh
set -euo pipefail
here=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
# shellcheck source=opencode/tests/lib.sh
. "$here/tests/lib.sh"

SCRIPT="$here/wstunnel-up.sh"
WF="$here/../.github/workflows/_agent-run.yml"

[ -f "$SCRIPT" ] || ko "script introuvable : $SCRIPT"
[ -f "$WF" ] || ko "workflow introuvable : $WF"
grep -q 'OPENCODE_WSTUNNEL_URL' "$WF" || ko "secret OPENCODE_WSTUNNEL_URL absent de _agent-run.yml"
grep -q 'wstunnel-up.sh' "$WF" || ko "wstunnel-up.sh non branché dans _agent-run.yml"
ok "workflow câblé wstunnel"

# Vide
set +e
out=$(env -u OPENCODE_WSTUNNEL_URL bash "$SCRIPT" 2>&1)
rc=$?
set -e
[ "$rc" -eq 2 ] || ko "URL vide doit rc=2 (got $rc): $out"
ok "refuse URL vide"

# Schéma invalide
set +e
out=$(env OPENCODE_WSTUNNEL_URL='ftp://x' bash "$SCRIPT" 2>&1)
rc=$?
set -e
[ "$rc" -eq 2 ] || ko "ftp:// doit rc=2 (got $rc): $out"
ok "refuse schéma invalide"

echo "wstunnel-up: OK"
