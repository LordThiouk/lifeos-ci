#!/usr/bin/env bash
# Vérifie qu'un agent FullRun existe dans la config opencode fusionnée et que sa
# fiche <agent>.md est présente. Affiche agent, fiche et mode ; échoue sinon.
#   check-agent.sh <config-fusionnée> <dossier-agents> <agent>
# Un agent vide (task, run sans TARGET_AGENT) est accepté sans contrôle.
set -euo pipefail

cfg=${1:-}
dir=${2:-}
agent=${3:-}
[ -n "$cfg" ] && [ -n "$dir" ] \
  || { echo "usage: check-agent.sh <config> <agents-dir> <agent>" >&2; exit 2; }
[ -n "$agent" ] || exit 0
[ -f "$cfg" ] || { echo "::error::config opencode fusionnée absente : $cfg" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "::error::jq est requis" >&2; exit 1; }

if ! jq -e --arg a "$agent" '.agent[$a] // empty' "$cfg" >/dev/null 2>&1; then
  echo "::error::agent '$agent' absent de la config opencode fusionnée ($cfg)" >&2
  exit 1
fi
mode=$(jq -r --arg a "$agent" '.agent[$a].mode // "default"' "$cfg")
fiche="$dir/$agent.md"
if [ ! -f "$fiche" ]; then
  echo "::error::fiche absente pour l'agent '$agent' : $fiche" >&2
  exit 1
fi
echo "Agent FullRun : $agent"
echo "Fiche : $fiche"
echo "Mode : $mode"
