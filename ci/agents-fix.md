# lifeos-ci : charger vraiment les agents FullRun (Silas, Forge, Engineer, Aditi, Vera, Serena, Anvil, Max)

Dépôt lifeos-ci, branche fix/agents-load-2026-11-26.
Constat (preuve) : .github/workflows/_agent-run.yml lance `opencode run --agent "$TARGET_AGENT"` (l. 525-527), mais la config passée via OPENCODE_CONFIG="$RUNNER_TEMP/oc/opencode.json" (l. 565) ne contient aucun bloc "agent". La vraie config opencode/config/opencode.json (agents Silas l.165, Engineer l.115, ForgeContext l.120…) n'est jamais utilisée. Les fiches ~/.claude/agents/<Nom>.md ne sont pas copiées dans le home du runner (seuls LIFEOS et hooks le sont). Il n'existe pas d'agent nommé « Forge ». Les agents sont en "mode": "subagent". Résultat : opencode tourne avec son agent par défaut.

Fais UNIQUEMENT ceci :
1. Dans l'étape « Configurer opencode et git », fusionner (avec jq) le bloc "agent" de opencode/config/opencode.json dans $RUNNER_TEMP/oc/opencode.json, en gardant les permissions CI telles quelles (elles priment).
2. Dans « Préparer le socle ISA », copier lifeos/agents (ou le dossier source réel des fiches <Nom>.md dans le clone lifeos, à trouver) vers "$agent_home/.claude/agents".
3. Pour chaque agent appelé par les workflows fr-* (TARGET_AGENT), forcer "mode": "primary" dans la config fusionnée, et ajouter un agent "Forge" (alias de ForgeContext ou de la fiche Forge si elle existe).
4. Avant `opencode run`, échouer clairement (exit 1, ::error::) si TARGET_AGENT n'existe pas dans la config fusionnée ou si sa fiche .md est absente. Afficher dans le log : agent, chemin de la fiche, mode.
5. Ajouter un test shell (tests/ ou opencode/) qui vérifie la fusion et l'erreur sur un agent inconnu. Le lancer et coller la sortie dans le message de commit.
Ne touche pas aux autres permissions, au push, ni à .fullrun. Commit après chaque point, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Aucun secret dans le log.
