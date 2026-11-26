# Rider F4-32 — mini étape A1 (2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15, tête 7270fcb (wip F4-32). ISA : dossier MEMORY/WORK/20261006-galass-rider-multistop/.
Fais UNIQUEMENT ceci, et rien d'autre : dans global_driver_model, ajoute/termine les champs de position du chauffeur déjà fournis par le backend (position de départ explicite puis position live), en partant du diff de 7270fcb (`git show 7270fcb -- '*global_driver_model*'`). Ne lis pas tout le dépôt.
Fais un commit dès que le fichier compile (`flutter analyze` sur ce fichier seul), dans les 10 premières minutes. Ensuite seulement, si le temps le permet, branche ride_map_controller sur ces champs, avec un second commit.
Aucun changement d'interface visuelle : les golden existants de la branche multistop ne doivent pas changer et ne doivent jamais être régénérés.
Ne touche pas aux tests, à l'ISA, à ride_details_controller ni à poly_line_map (étapes suivantes). Galass_backend en lecture seule. Pas de revue. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
