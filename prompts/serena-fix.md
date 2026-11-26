# lifeos-ci — corriger UNIQUEMENT le plantage de Serena (Papa 2026-11-25)

Branche fix/extra-repos-full. Run 45696188565 : job serena (fr-plan-serena.yml → _agent-run.yml), « Exécuter opencode » finit en erreur en < 1 s après l'installation de ffmpeg, sans commit. Le job vera du même run a réussi.

1. `gh run view 45696188565 -R LordThiouk/lifeos-ci --log` : compare les étapes serena et vera, trouve la cause exacte (preuve file:line).
2. Corrige-la avec le plus petit changement possible. Commit TÔT dès que la correction est écrite (avant toute vérification longue).
3. Écris FIX-SERENA.md (5 lignes : cause, correction, preuve). Commit.

Rien d'autre. Sois rapide. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push.
