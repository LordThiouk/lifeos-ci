# FIX-CI

Runs en échec : `gh run list`/`--log-failed` non autorisés ici ; causes identifiées
par lecture des workflows et `actionlint` (les échecs de quota modèle sont ignorés).

## 1. Boucle de relance jamais déclenchée
- Échec : un build brick en échec laisse les jobs aval `skipped` ; la boucle ne voit aucun `failure`.
- Cause : `.github/workflows/fr-fullrun.yml:297-303` (needs/condition limités à code_review, forge_audit, silas, max).
- Fix : ajout de aditi_ui/engineer/anvil/forge_code aux needs et de leurs `result == 'failure'`.
- Commit : e5827e7

## 2. Garde-fou extra_repos cassé par un changement de branche
- Échec : l'agent inspecte une autre branche d'un extra (read-only) et le job échoue.
- Cause : `.github/workflows/_agent-run.yml:637-649` poussait chaque extra et comparait son HEAD local à `IN_BRANCH`.
- Fix : les extras ne sont jamais poussés ; `git ls-remote` compare la ref distante au SHA de départ.
- Commits : bf49442, 7a1a5b7, 6546444

## 3. Actionlint en échec (job CI)
- Échec : `actionlint` retourne 1 sur un default posé sur un input `workflow_call` requis.
- Cause : `fr-*.yml:70-71` (fr-plan-vera/serena, build-engineer/anvil/forge-code, verify-*, close-max).
- Fix : suppression de `default: antenly` sous `workflow_call`.
- Commit : ac70b13

## Validation
- `actionlint 1.7.12 -ignore SC2129 .github/workflows/*.yml` : OK.
- `shellcheck -x opencode/*.sh targets/*.sh` : OK.
- YAML parsé pour tous les workflows.
- 13 tests socle (`opencode/tests/*-test.sh`) : OK ; `run-all.sh` non allant (timeout sandbox).
