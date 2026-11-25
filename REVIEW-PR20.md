# Revue PR #20 — fix/extra-repos-full → main

Diff : 20 fichiers, +160/−18 (11 workflows, FIX-CI.md, 7 prompts/, targets/allowed-repos.sh).
Commits clés : 904f550 … 4d43b7e.

## Vérifications
- Extra : clone complet + `fetch +refs/heads/*` (_agent-run.yml:219-236) ; jeton uniquement via `-c` éphémère, contrôle `.git/config` (237-238) OK.
- Garde-fou : `remote_sha` via `git ls-remote` (579-589), comparaison de la ref distante et non du HEAD local (668-676) OK.
- HF_TOKEN ciblé antenly/antenly-ci (_agent-run.yml:435-443) OK ; ffmpeg installé (423-427) OK.
- acr-senegal extra-only (allowed-repos.sh:13,46-56,67) ; refusé comme target (test rc=1) OK.
- FullRun : builds dans `needs` + `contains(needs.*.result,'failure')` (fr-fullrun.yml:295-309) OK.
- Validations : actionlint 1.7.12 rc=0, YAML python OK, shellcheck -x OK, bash -n OK ; aucun secret en dur vu dans le diff.

## Risques (non bloquants) + correctifs proposés
1. fr-fullrun.yml:309 — `always()` peut relancer après une annulation si un échec précède ; utiliser `!cancelled() && contains(...)`.
2. _agent-run.yml:671-675 — seule `$IN_BRANCH` est comparée ; un push/suppression d'une autre branche extra passerait. Comparer toutes les refs distantes.
3. _agent-run.yml:279-288 — base extra = HEAD local ; si le clone `--branch` échoue alors que la branche existe, faux positif à 673. Enregistrer le SHA `ls-remote` comme base.
4. _agent-run.yml:237 — contrôle sans `--local`, dépend de `GIT_CONFIG_GLOBAL=/dev/null` (213-214) ; ajouter `--local`.
5. _agent-run.yml:423 — ffmpeg non épinglé et systématique ; risque réseau/dérive.

## Artefacts de process (ne pas fusionner sur main)
prompts/allow-acr.md, extra-fetch.md, extra-fetch2.md, fix-ci.md, fr303.md, hf-ffmpeg.md, review20.md, ainsi que FIX-CI.md : prompts/rapports de run, à retirer de la PR ou supprimer après merge (non bloquant).

MERGE OK
