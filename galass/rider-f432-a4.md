# Rider F4-32 — mini étape A4 tests (2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15, tête 6e11126 (après a1+a2+a3 : GlobalDriverInfo → seed → poly_line_map). ISA : dossier MEMORY/WORK/20261006-galass-rider-multistop/.
Fais UNIQUEMENT ceci : lance les tests / golden **déjà présents** liés à la carte course / position chauffeur / multistop (ex. `flutter test` ciblé sur les fichiers de test existants du parcours ride map). Colle la sortie.
Interdit : régénérer ou modifier un golden ; toucher le code de prod hors correction de test cassé par a1–a3 ; flaky inventé.
Si les tests ciblés passent : coche F4-32 via ISATool (ou mise à jour minimale ISA) uniquement pour cette case. Sinon : BLOCK dans le message de commit, ne coche pas.
`flutter analyze` si tu touches un fichier. Un petit commit. Galass_backend en lecture seule. Pas de revue. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun. Ne lis pas evidence/, kuna_*.c, match_*.md.
