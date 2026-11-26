# Revue briques c — FullRun (lifeos-ci)

Verdict : **MERGE OK**

| Brique | YAML | inputs (call = dispatch + chain) | agent/target/step/phase | next (chain && ok) | secret/push | inputs `_agent-run` |
|---|---|---|---|---|---|---|
| verify-forge-audit | OK | OK | forge-audit/Forge/5/verify | OK | aucun | tous présents |
| verify-silas | OK | OK | silas/Silas/5/verify | OK | aucun | tous présents |
| close-max | OK | OK | max/Max/6/close | OK | aucun | tous présents |

Contrôles effectués :
- Les 3 fichiers parsent en YAML (jobs `run`, `next`).
- `workflow_dispatch` et `workflow_call` exposent exactement les mêmes 10 inputs, `chain` inclus dans les deux.
- Les 13 inputs transmis à `_agent-run.yml` existent tous dans son bloc `workflow_call` (aucun inconnu, aucun manquant).
- `next` : `if: inputs.chain && needs.run.outputs.status == 'ok'` dans les 3.
- Aucun secret en dur, aucune commande de push ; `secrets: inherit` uniquement.

Non bloquant :
- `fr-verify-silas.yml:60` et `fr-close-max.yml:60` : input `chain` sans `description` (présente dans `fr-verify-forge-audit.yml:60`).
- `fr-close-max.yml:4` : commentaire « Premier agent FullRun » inexact (c'est le dernier de la chaîne).
