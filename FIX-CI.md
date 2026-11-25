# FIX-CI

Continuation : les 3 correctifs sont présents sur la branche ; aucun nouveau
correctif de script nécessaire. Logs de runs non consultables (`gh` interdit dans
la sandbox) : analyse par lecture des workflows, `actionlint`, `shellcheck` et tests.

## 1. Boucle de relance jamais déclenchée
- Échec : un build brick en échec laisse les jobs aval `skipped` ; la boucle ne voit aucun `failure`.
- Cause : `.github/workflows/fr-fullrun.yml:298-307` (needs/condition limités aux verify + max).
- Fix : ajout de aditi_ui/engineer/anvil/forge_code aux needs et de leurs `result == 'failure'`.
- Commit : 41ea55f

## 2. Garde-fou extra_repos cassé par un changement de branche
- Échec : l'agent inspecte une autre branche d'un extra (read-only) et le job échoue.
- Cause : `.github/workflows/_agent-run.yml:668-675` comparait le HEAD local au SHA de départ.
- Fix : `remote_sha` (ligne 579) via `git ls-remote` compare la ref distante ; HEAD ignoré.
- Commits : f1e91c4, c66261b, 8cb2e96

## 3. Actionlint en échec (job CI)
- Échec : `actionlint` rc=1 sur un `default` posé sur un input `workflow_call` requis.
- Cause : `fr-*.yml:70-71` (plan/build/verify/close).
- Fix : suppression de `default: antenly` sous `workflow_call`.
- Commit : 0c5cc2d

## Validation (continuation)
- `actionlint 1.7.12 -ignore SC2129 .github/workflows/*.yml` : OK.
- `shellcheck -x opencode/*.sh targets/*.sh` : OK ; YAML parsé : OK.
- 13 tests socle OK ; échecs restants dus à l'environnement (rg/bun/age absents), pas au dépôt.
