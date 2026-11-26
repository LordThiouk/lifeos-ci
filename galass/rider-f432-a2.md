# Rider F4-32 — mini étape A2 (2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15, tête 5363a7b (après a1 : GlobalDriverInfo + seedDriverLocation). ISA : dossier MEMORY/WORK/20261006-galass-rider-multistop/.
Fais UNIQUEMENT ceci, et rien d'autre : dans ride_details_controller, branche la position chauffeur déjà fournie par le backend (champs GlobalDriverInfo / seed vers la carte) pour que le départ explicite puis le live arrivent jusqu'à la map. Relis d'abord `git show 5363a7b f53f974 --stat` et le diff pertinent ; ne lis pas tout le dépôt.
Ne touche pas à poly_line_map (étape a3), ni aux tests, ni à l'ISA, ni à l'UI visuelle. Les golden multistop existants ne doivent pas changer et ne doivent jamais être régénérés.
`flutter analyze` sur le fichier touché doit passer. Un petit commit dès que c'est fini. Galass_backend en lecture seule. Pas de revue. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
