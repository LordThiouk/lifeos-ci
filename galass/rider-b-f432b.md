# Rider build F4-32 — reprise (mini étape, Papa 2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15, tête 7270fcb (wip F4-32 coupé au délai). ISA : dossier MEMORY/WORK/20261006-galass-rider-multistop/ (plan Serena F13).
Fais UNIQUEMENT F4-32 (Forge) : termine et vérifie le travail de 7270fcb (ride_map_controller, ride_details_controller, global_driver_model, poly_line_map, 3 tests). La position du chauffeur EXISTE déjà dans le backend (Galass_backend en lecture seule) : le Rider la récupère, position de départ explicite puis live. Aucun changement backend. Garde les tests utiles, corrige ce qui est faux, nettoie le message wip par un commit propre (pas de réécriture d'historique). Coche F4-32 via ISATool.ts avec preuve (file:line + test).
Ne fais PAS la fermeture du reste de l'ISA (étape suivante séparée). Pas de revue Max. Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
