# REVIEW-ASSEMBLE

Verdict : **MERGE OK**

- YAML valide : 11 fichiers `fr-*.yml` + `_agent-run.yml` + `_next.yml` parsés sans erreur.
- Bricks appelées par `fr-fullrun.yml` toutes présentes : vera, serena, aditi-ui, engineer, anvil, forge-code, code-review, forge-audit, silas, max.
- Chaque brique déclare `workflow_call` et l'entrée `chain` (`fr-*.yml` lignes 64-65 / 108-113).
- Entrées transmises à `_agent-run.yml` (agent, target_repo, extra_repos, lifeos_write, branch, prompt_path, isa_path, job_name, lifeos_ref, timeout_minutes, target_agent, stop_after_step, chain_phase) toutes déclarées (`_agent-run.yml:7-55`).
- Ordre `fr-fullrun` correct via `needs` : vera → serena → builds → code-review → forge-audit → silas → max.
- Boucle : échec de code-review/forge-audit/silas/max relance `start_phase=build` si `attempt < max_attempts` (`fr-fullrun.yml:297-344`).
- Aucun marqueur de conflit (`<<<<<<<`) ; aucun secret en dur (`secrets: inherit`).
- Note non bloquante : un échec d'une brique build ne déclenche pas `loop` (les 4 dépendances sont `skipped`, pas `failure`) — `fr-fullrun.yml:303`.
- Note non bloquante : ordre de chaînage `_next.yml` (forge-audit → silas → code-review) diffère de `fr-fullrun` (`_next.yml:101`), sans effet car `chain: false` dans le FullRun.
