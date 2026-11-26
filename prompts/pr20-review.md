# lifeos-ci — revue PR #20 (fix/extra-repos-full → main), mini workflow (Papa 2026-11-26 03:48 Dakar)

Fais une revue de code de la PR #20 (diff `git diff origin/main...HEAD`) avec le skill de revue (requesting-code-review / code-review). Points à vérifier : workflows YAML valides, entrées cohérentes (chain défaut false partout, propagé au job next), aucun secret ni HF_TOKEN transmis hors cibles antenly, aucune régression sur task.yml / fr-fullrun.yml, scripts bash valides (bash -n).
Écris le verdict dans REVIEW-PR20.md : en tête une ligne `VERDICT: OK` ou `VERDICT: KO`, puis les problèmes bloquants (fichier:ligne) et non bloquants. Ne corrige rien. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Pas de merge.
