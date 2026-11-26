VERDICT: OK

# Revue PR #20 — fix/extra-repos-full → main

Revue statique du diff `git diff origin/main...HEAD` (HEAD `a1b543b`, 35 fichiers,
+1152/−91). Aucun problème bloquant.

## Vérifications effectuées
- YAML : `python3 yaml.safe_load` sur les 17 workflows → OK.
- actionlint 1.7.12 (`-ignore SC2129`) sur `.github/workflows/*.yml` → rc=0.
- shellcheck 0.11.0 `-x opencode/*.sh targets/*.sh` → rc=0.
- `bash -n` sur tous les `*.sh` et sur chaque script `run:` inline des workflows → 0 erreur.
- Entrées : `chain` défaut `false` dans les 10 workflows d'étape (dispatch + call), propagé au job `next` (`chain: ${{ inputs.chain }}`), gardé par `inputs.chain` (`_next.yml:75`) et re-propagé en `-F chain=true` (`_next.yml:183-188`). `fr-fullrun.yml` appelle toutes les briques avec `chain: false`.
- HF_TOKEN : exporté vers opencode uniquement si `target_repo ∈ {antenly, antenly-ci}` (`_agent-run.yml:499`), via `hf_env` (`_agent-run.yml:506-509`) ; aucun autre usage. Aucun secret en dur dans le diff.
- Extra repos : clone complet + fetch de toutes les branches avec jeton éphémère `-c` (`_agent-run.yml:249-267`), puis contrôle d'absence du jeton dans `.git/config` (265-266).
- Garde-fou extra en lecture seule basé sur `git ls-remote` (réf distante, pas le HEAD local) (`_agent-run.yml:738-750`, 830-840).
- Pas de régression `task.yml` (inchangé, n'envoie pas `model` → défaut "") ; `fr-fullrun.yml` valide et cohérent (`needs`/`gate`/`loop`).
- Tests ciblés PASS (rc=0) : `allowed-repos-test.sh`, `allowed-repos-lifeos-test.sh`, `lifeos-chain-test.sh`, `critical-state-isolation-test.sh`, `critical-git-isolation-test.sh`, `critical-frozen-tools-test.sh`, `quota-test.sh`, `redact-test.sh`, `internals-test.sh`, `split-diff-test.sh`, `lifeos-guard-test.sh`, `upstream-fullrun/{extra-repos,stop-after-step,first-link-prompt,chain-step,ffmpeg-install}-test.sh`.

## Problèmes bloquants
Aucun.

## Problèmes non bloquants
1. `fr-fullrun.yml:343-359` + `:374` — le job `gate` traite un statut `quota` (job en `success`) comme un échec, donc `loop` relance le FullRun (jusqu'à `max_attempts`) alors que `quota` est une fin propre côté `_next.yml:105-111`. Risque de relances inutiles et coûteuses. Piste : exclure explicitement `status == 'quota'` du gate.
2. `_agent-run.yml:844-849` + `fr-fullrun.yml:351` — `head_sha` est renseigné même sans nouveau commit (`head_sha="$h"` avant le test `count == 0`), donc le garde-fou « étape réussie sans commit » ne détecte pas réellement l'absence de commit. Un `status=ok` obtenu seulement via `/tmp/task_done.md` (`_agent-run.yml:634`) passe.
3. `_agent-run.yml:830-840` — le garde-fou extra en lecture seule ne compare que `IN_BRANCH` ; un push ou une suppression sur une autre branche d'un dépôt extra ne serait pas détecté.
4. `_agent-run.yml:249-257`, `:315`, `:836` — la base extra est le HEAD local du clone ; si le `clone --branch` échoue alors que la branche existe et que le fallback s'exécute, `base` (branche par défaut) diffère de `remote_sha(IN_BRANCH)` → faux positif « référence distante modifiée ».
5. `_agent-run.yml:265` — `git config --get-all http...` sans `--local`, ce qui dépend de `GIT_CONFIG_GLOBAL=/dev/null` / `GIT_CONFIG_NOSYSTEM=1` (`:241-242`). Ajouter `--local` durcirait le contrôle.
6. `_agent-run.yml:483-487` — ffmpeg installé via apt, non épinglé et à chaque run (coût/réseau) ; `ci.yml` utilise un binaire épinglé par SHA.
7. `_agent-run.yml:409` — `oven-sh/setup-bun@v2` non épinglé par SHA, alors que `ci.yml:80` le pin. Incohérence d'hygiène supply-chain.
8. `opencode/allowed-repos.sh:10` (liste Galass) diverge de `targets/allowed-repos.sh:11-14` (liste lifeos-ci + `acr-senegal`) ; `opencode/extra-repos.sh` (chemin `opencode-fullrun.yml`) n'accepte donc pas `acr-senegal`. Hors périmètre du chemin `_agent-run`, mais divergence à surveiller.
9. `_agent-run.yml:523` — `$(( (IN_TIMEOUT_MIN - 5) * 60 ))` interprète une valeur à zéro initial (`08`, `09`) comme un octal → erreur arithmétique, alors que la validation `_agent-run.yml:188` accepte `^[0-9]+$`. Cas limite.
10. Artefacts de process dans la PR : `prompts/*.md`, `FIX-CI.md`, `FIX-VERA-AUDIT.md`, `docs/galass-bugs-isa-locate-2026-11-25.md` — prompts/rapports de run, à retirer ou supprimer après merge (non bloquant).

## Conclusion
VERDICT: OK — aucune anomalie bloquante ; points ci-dessus à traiter en suivi.
