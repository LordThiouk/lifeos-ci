#!/usr/bin/env bash
# Lance `timeout …` en enregistrant le PID dans $1 (pour silence-watch).
# Usage : oc-wrap.sh <pid-file> <secs> <cmd> [args…]
set -euo pipefail
echo $$ > "$1"
shift
exec timeout "$@"
