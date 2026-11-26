#!/usr/bin/env bash
# Fusionne le bloc "agent" de la config opencode de référence dans la config
# éphémère du runner. Les autres clés (dont "permission") ne sont pas touchées :
# les permissions CI priment.
#   merge-agents.sh <config-source> <config-destination>
set -euo pipefail

src=${1:-}
dest=${2:-}
[ -n "$src" ] && [ -n "$dest" ] \
  || { echo "usage: merge-agents.sh <config-source> <config-destination>" >&2; exit 2; }
[ -f "$src" ] || { echo "config source introuvable : $src" >&2; exit 1; }
[ -f "$dest" ] || { echo "config destination introuvable : $dest" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "jq est requis" >&2; exit 1; }

agents=$(jq -c '.agent // {}' "$src") \
  || { echo "bloc agent illisible dans $src" >&2; exit 1; }

tmp=$(mktemp "${dest}.XXXXXX")
trap 'rm -f "$tmp"' EXIT

jq -n --slurpfile base "$dest" --argjson ref "$agents" '
  $base[0]
  | .agent = $ref
' > "$tmp"

mv "$tmp" "$dest"
trap - EXIT
echo "Bloc agent fusionné dans $dest"
