# agents-load — correctif B1 revue (Papa 2026-11-26)

Dépôt lifeos-ci, branche fix/agents-load-2026-11-26. Revue : REVIEW-AGENTS-LOAD.md (VERDICT BLOCK).

Fais UNIQUEMENT le correctif **B1** : les runs `agent: task` ne doivent plus charger une config fusionnée qui référence des fichiers absents.
- Cause : étape « Configurer opencode et git » fusionne tout le bloc `.agent` pour tous les runs ; les fiches / prompt Nix ne sont copiés que si `inputs.agent != 'task'`.
- Correctif : conditionner la fusion FullRun à `inputs.agent != 'task'`, **ou** préparer aussi les fiches + prompt Nix pour `task` — choisis le minimal qui laisse `task` OK et FullRun OK.
- Mets à jour `opencode/tests/agents-load-test.sh` pour couvrir le chemin `task` (pas de bad file reference).
- Mets à jour REVIEW-AGENTS-LOAD.md : si B1 corrigé et test vert → VERDICT: PASS ; sinon reste BLOCK avec preuve.

Pas de merge main. Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push hors la branche de travail. Ne touche pas .fullrun.
