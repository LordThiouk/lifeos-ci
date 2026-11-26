# lifeos-ci agents-load — revue avant merge Papa (2026-11-26)

Dépôt lifeos-ci, branche fix/agents-load-2026-11-26 (vs main). Hors ISA → revue seulement.
Périmètre : `_agent-run.yml`, `opencode/merge-agents.sh`, `opencode/check-agent.sh`, `opencode/tests/agents-load-test.sh`. Vérifie que les agents FullRun (Vera, Serena, Forge, Engineer, Aditi, Anvil, Silas, Max, code-reviewer) sont bien chargés (config fusionnée + fiches + mode primary + échec si agent inconnu). Lance `opencode/tests/agents-load-test.sh` (ou via run-all) et colle la sortie.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien. Ne merge pas.
Écris VERIFY-AGENTS-LOAD.md à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sortie tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
