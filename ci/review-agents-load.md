# lifeos-ci agents-load — revue (task) (2026-11-26)

Dépôt lifeos-ci, branche fix/agents-load-2026-11-26 (diff vs main). Hors ISA.
Fais UNIQUEMENT une **revue** du fix agents-load (chargement agents FullRun). Périmètre : `_agent-run.yml`, `opencode/merge-agents.sh`, `opencode/check-agent.sh`, `opencode/tests/agents-load-test.sh`. Lance le test `opencode/tests/agents-load-test.sh` si possible et colle la sortie. Vérifie que Vera/Serena/Forge/Engineer/Aditi/Anvil/Silas/Max/code-reviewer sont bien chargés (config fusionnée + fiches + mode primary + échec si agent inconnu).
Écris REVIEW-AGENTS-LOAD.md à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants / non bloquants, sortie test. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne corrige pas le code. Ne merge pas. Ne touche pas .fullrun.
