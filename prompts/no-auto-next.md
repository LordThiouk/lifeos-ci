# lifeos-ci — pas d'enchaînement automatique sur les mini workflows (Papa 2026-11-26)

Branche fix/extra-repos-full. Règle de Papa : le passage automatique à l'étape suivante (job `next` / _next.yml) ne sert QUE pour l'assemblage FullRun complet ; un mini workflow lancé seul (fr-plan-vera, fr-plan-serena, fr-fullrun lancé avec un prompt d'étape) reste à son étape.
Constat : run 45746757190 (fr-plan-vera, lancé à la main) a déclenché tout seul fr-plan-serena (run 45747836096), qui a fini en startup_failure.
Fais :
1. Ajoute une entrée explicite (ex. `chain`, booléen, défaut false) aux workflows d'étape ; le job `next` ne tourne que si chain == true. Seul l'assemblage FullRun complet la passe à true et la propage.
2. Trouve la cause du startup_failure de fr-plan-serena (run 45747836096) et corrige-la (ou explique-la si ce n'est que l'enchaînement).
3. Documente en 5 lignes dans FIX-VERA-AUDIT.md.
Petits commits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Pas de merge.
