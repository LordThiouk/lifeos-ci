VERDICT: PASS

# Revue agents-load — 2026-11-26

Périmètre : `_agent-run.yml`, `opencode/merge-agents.sh`, `opencode/check-agent.sh`,
`opencode/tests/agents-load-test.sh` (diff vs `origin/main`, commit de base `ef1fcca`).
B1 (régression des runs `task`) est corrigé et couvert par le test : verdict PASS.

## Points bloquants

### B1. Les runs `task` chargent une config fusionnée qui référence des fichiers absents (corrigé)

Constat initial :

- L'étape « Configurer opencode et git » s'exécute pour **tous** les runs, y compris
  `agent: task`, et fusionnait tout le bloc `.agent` de la config de référence.
- Ce bloc référence le prompt `Nix/LifeOS` et toutes les fiches
  `{file:{env:HOME}/.claude/agents/<Nom>.md}`.
- Or ces fichiers ne sont copiés que dans l'étape « Préparer le socle ISA inscriptible
  (agents FullRun) », gardée par `if: ${{ inputs.agent != 'task' }}`.
- opencode valide les références `{file:...}` **au chargement** de la config (cf. commit
  `20eef62`) : chaque run `task` échouait en « bad file reference ».

Correctif appliqué (minimal) : la fusion FullRun est conditionnée à
`IN_AGENT != task` dans « Configurer opencode et git ». Pour `task`, la config
éphémère ne contient aucun bloc `.agent` et donc aucune référence `{file:...}` ;
les runs FullRun continuent de fusionner (fiches + prompt Nix déjà préparés).
Aucune étape `.fullrun` n'est modifiée.

Couverture : `opencode/tests/agents-load-test.sh` vérifie désormais (1) que le
workflow garde la fusion sous `IN_AGENT != task` et le socle ISA sous
`inputs.agent != 'task'`, et (2) que la config du chemin `task` ne contient ni
bloc `.agent` ni référence `{file:...}` (pas de bad file reference).

## Points non bloquants

- **N1** — `check-agent.sh` n'impose pas `mode: primary` ; il l'affiche seulement
  (`check-agent.sh:21-29`). La garantie « primary » repose uniquement sur la liste
  `fullrun_agents` de `_agent-run.yml`. Un futur `target_agent` absent de cette liste
  mais présent en `subagent` dans la config de référence passerait la porte. Échouer si
  `mode != primary` durcirait le garde-fou.
- **N2** — `fr-plan-vera.yml:140` passe `agent: vera` mais aucun `target_agent` : Vera
  n'est jamais lancée via `--agent Vera` et la porte `check-agent.sh` n'est pas exercée
  pour la brique Vera. Vera est bien fusionnée (mode primary, fiche présente) mais
  inutilisée par ce workflow.
- **N3** — Le test crée des fiches synthétiques (`agents-load-test.sh:66-69`) et ne
  couvre pas la copie réelle `lifeos/agents` + `lifeos/opencode/agent`. Il ne
  détecterait pas une fiche réelle manquante. Vérification d'intégration manuelle faite
  ci-dessous : OK.

## Vérification des agents demandés

Fusion depuis `opencode/config/opencode.json` avec les fiches réelles (`lifeos/agents`
puis `lifeos/opencode/agent`, même logique que `_agent-run.yml:433-445`) :

| Agent | Config | Fiche | Mode |
| --- | --- | --- | --- |
| Vera | oui (créé) | `Vera.md` (opencode/agent) | primary |
| Serena | oui (créé) | `Serena.md` (opencode/agent) | primary |
| Forge | oui (alias ForgeContext) | `Forge.md` | primary |
| Engineer | oui (réf.) | `Engineer.md` | primary |
| Designer (brique aditi-ui) | oui (réf.) | `Designer.md` | primary |
| Architect (brique plan-serena) | oui (réf.) | `Architect.md` | primary |
| Anvil | oui (réf.) | `Anvil.md` | primary |
| Silas | oui (réf.) | `Silas.md` | primary |
| Max | oui (créé, absent de la config de référence) | `Max.md` | primary |
| code-reviewer | oui (créé) | `code-reviewer.md` (opencode/agent) | primary |

- « Aditi » n'existe pas comme agent : la brique `aditi-ui` lance
  `target_agent: Designer` (`fr-build-aditi-ui.yml:143`), contrôlé ci-dessus.

- Forge = alias de ForgeContext, prompt `{file:{env:HOME}/.claude/agents/Forge.md}`,
  mode `primary`.
- Agent inconnu (`Nope`) → exit 1 + `::error::agent 'Nope' absent de la config opencode fusionnée`.
- Fiche absente → exit 1 + `::error::fiche absente pour l'agent 'Forge'`.
- `shellcheck -x` sur les 3 scripts : exit 0.

## Sortie du test

Commande : `bash opencode/tests/agents-load-test.sh`

```
OK   bloc agent fusionné, 10 agents FullRun en mode primary
OK   Forge présent (alias ForgeContext, fiche Forge.md, mode primary)
OK   permissions et clés CI conservées (seul .agent est fusionné)
OK   check-agent.sh accepte les agents FullRun et affiche agent/fiche/mode
OK   agent inconnu refusé (exit 1, ::error::)
OK   fiche absente refusée (exit 1, ::error::)
OK   workflow : fusion .agent conditionnée à IN_AGENT != task
OK   chemin task : config sans .agent, aucune référence de fichier (pas de bad file reference)
EXIT=0
```

Le chemin `task` est désormais couvert : la config du run ne référence aucun
fichier absent, donc plus de « bad file reference » au chargement.
