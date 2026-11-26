#!/usr/bin/env bash
# Vérifie la fusion du bloc "agent" dans la config opencode du runner, le mode
# primary des agents FullRun, l'alias Forge, et l'échec clair sur un agent
# inconnu ou une fiche absente.
#   opencode/tests/agents-load-test.sh
set -uo pipefail
here=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
# shellcheck source=opencode/tests/lib.sh
. "$here/tests/lib.sh"
tmp=$(mktemp -d) || exit 1
trap 'chmod -R u+w "$tmp" 2>/dev/null; rm -rf "$tmp"' EXIT

command -v jq >/dev/null 2>&1 || ko "jq requis pour ce test"
src="$here/config/opencode.json"
merge="$here/merge-agents.sh"
check="$here/check-agent.sh"
[ -f "$src" ] || ko "config source introuvable : $src"
[ -f "$merge" ] || ko "merge-agents.sh introuvable"
[ -f "$check" ] || ko "check-agent.sh introuvable"

# Config CI minimale : ses clés (permissions, mcp, ...) doivent survivre.
cat > "$tmp/ci.json" <<'JSON'
{
  "$schema": "https://opencode.ai/config.json",
  "autoupdate": false,
  "share": "disabled",
  "mcp": {},
  "permission": {
    "doom_loop": "deny",
    "bash": {"*": "allow", "git push*": "deny", "gh *": "deny"}
  }
}
JSON

agents=(Silas Forge Engineer Designer Architect Anvil Max code-reviewer Vera Serena)
bash "$merge" "$src" "$tmp/ci.json" "${agents[@]}" > "$tmp/merge.out" 2>&1 \
  || ko "merge-agents.sh a échoué : $(cat "$tmp/merge.out")"

# --- 1. bloc agent fusionné, agents FullRun en mode primary -----------------
for a in "${agents[@]}"; do
  mode=$(jq -r --arg a "$a" '.agent[$a].mode // ""' "$tmp/ci.json")
  [ "$mode" = primary ] || ko "agent $a absent ou mode != primary (mode=$mode)"
done
ok "bloc agent fusionné, ${#agents[@]} agents FullRun en mode primary"

# --- 2. Forge présent en alias de ForgeContext, fiche Forge.md --------------
forge_prompt=$(jq -r '.agent.Forge.prompt // ""' "$tmp/ci.json")
[ "$forge_prompt" = '{file:{env:HOME}/.claude/agents/Forge.md}' ] \
  || ko "prompt Forge inattendu : $forge_prompt"
[ "$(jq -r '.agent.Forge.mode' "$tmp/ci.json")" = primary ] \
  || ko "Forge n'est pas en mode primary"
ok "Forge présent (alias ForgeContext, fiche Forge.md, mode primary)"

# --- 3. permissions et clés CI intactes (la fusion ne touche que .agent) ----
[ "$(jq -r '.permission.doom_loop' "$tmp/ci.json")" = deny ] \
  || ko "permission doom_loop modifiée"
[ "$(jq -r '.permission.bash["git push*"]' "$tmp/ci.json")" = deny ] \
  || ko "permission git push modifiée"
[ "$(jq -r '.permission.bash["gh *"]' "$tmp/ci.json")" = deny ] \
  || ko "permission gh modifiée"
[ "$(jq -c '.mcp' "$tmp/ci.json")" = '{}' ] || ko "clé mcp modifiée"
[ "$(jq -r '.autoupdate' "$tmp/ci.json")" = false ] || ko "clé autoupdate modifiée"
ok "permissions et clés CI conservées (seul .agent est fusionné)"

# --- 4. fiches présentes : agent/fiche/mode acceptés ------------------------
mkdir -p "$tmp/agents"
for a in "${agents[@]}"; do
  printf -- '---\nname: %s\n---\n' "$a" > "$tmp/agents/$a.md"
done
for a in "${agents[@]}"; do
  out=$(bash "$check" "$tmp/ci.json" "$tmp/agents" "$a" 2>&1) \
    || ko "check-agent.sh refuse $a : $out"
  printf '%s\n' "$out" | grep -qx "Agent FullRun : $a" \
    || ko "log check-agent incomplet pour $a : $out"
  printf '%s\n' "$out" | grep -qx "Mode : primary" \
    || ko "mode non affiché pour $a : $out"
done
ok "check-agent.sh accepte les agents FullRun et affiche agent/fiche/mode"

# --- 5. agent inconnu : échec clair ----------------------------------------
rc=0
out=$(bash "$check" "$tmp/ci.json" "$tmp/agents" Nope 2>&1) || rc=$?
[ "$rc" -ne 0 ] || ko "agent inconnu accepté"
printf '%s\n' "$out" | grep -q "::error::agent 'Nope' absent" \
  || ko "message d'erreur agent inconnu absent : $out"
ok "agent inconnu refusé (exit $rc, ::error::)"

# --- 6. fiche absente : échec clair ----------------------------------------
rm -f "$tmp/agents/Forge.md"
rc=0
out=$(bash "$check" "$tmp/ci.json" "$tmp/agents" Forge 2>&1) || rc=$?
[ "$rc" -ne 0 ] || ko "agent sans fiche accepté"
printf '%s\n' "$out" | grep -q "::error::fiche absente" \
  || ko "message d'erreur fiche absente absent : $out"
ok "fiche absente refusée (exit $rc, ::error::)"
