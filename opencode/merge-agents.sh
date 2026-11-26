#!/usr/bin/env bash
# Fusionne le bloc "agent" de la config opencode de référence dans la config
# éphémère du runner. Les autres clés (dont "permission") ne sont pas touchées :
# les permissions CI priment.
#   merge-agents.sh <config-source> <config-destination> [agent...]
# Chaque agent listé est forcé en "mode": "primary" (créé depuis sa fiche
# ~/.claude/agents/<Nom>.md s'il manque). "Forge" est ajouté en alias de
# ForgeContext, avec la fiche Forge.md.
set -euo pipefail

src=${1:-}
dest=${2:-}
[ -n "$src" ] && [ -n "$dest" ] \
  || { echo "usage: merge-agents.sh <config-source> <config-destination> [agent...]" >&2; exit 2; }
[ -f "$src" ] || { echo "config source introuvable : $src" >&2; exit 1; }
[ -f "$dest" ] || { echo "config destination introuvable : $dest" >&2; exit 1; }
shift 2
command -v jq >/dev/null 2>&1 || { echo "jq est requis" >&2; exit 1; }

agents=$(jq -c '.agent // {}' "$src") \
  || { echo "bloc agent illisible dans $src" >&2; exit 1; }

tmp=$(mktemp "${dest}.XXXXXX")
trap 'rm -f "$tmp"' EXIT

jq -n --slurpfile base "$dest" --argjson ref "$agents" --args '
  ($ARGS.positional) as $targets
  | $base[0]
  | .agent = (
      $ref
      | if has("Forge") then .
        else .Forge = ((.ForgeContext // {}) + {
          description: "Forge — alias de ForgeContext (fiche Forge.md)",
          mode: "primary",
          prompt: "{file:{env:HOME}/.claude/agents/Forge.md}"
        })
        end
      | with_entries(
          .key as $k
          | if ($targets | index($k)) != null
            then .value.mode = "primary"
            else .
            end
        )
      | reduce $targets[] as $t (.;
          if has($t) then .
          else .[$t] = {
            description: ($t + " — agent FullRun"),
            mode: "primary",
            prompt: ("{file:{env:HOME}/.claude/agents/" + $t + ".md}")
          }
          end
        )
    )
' "$@" > "$tmp"

mv "$tmp" "$dest"
trap - EXIT
echo "Agents fusionnés dans $dest : $(jq -r '.agent | keys | join(", ")' "$dest")"
