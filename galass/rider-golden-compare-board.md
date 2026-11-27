# Mini Rider — planche goldens course (main | multistop | diff) SANS regen

Dépôt `Galass_Rider`, branche `feat/multistop-rider-close-2026-11-20`.

**But :** produire pour Papa une planche de comparaison **sans régénérer** les PNG de référence :
- `course_en_cours_simple.png`
- `course_en_cours_stop1_actif.png`
- `course_en_cours_stop1_fait.png`
- `course_en_cours_tous_arrets_faits.png`
- `course_terminee.png`

## Étapes
1. `flutter test test/goldens/rider/rider_ride_sheet_golden_test.dart` **sans** `--update-goldens`.
2. Collecter pour chaque échec les images Flutter (`failures/` : masterDiff / isolatedDiff / candidate ou équivalent).
3. Committer sous `docs/goldens-compare/course/` (ou `test/goldens/rider/_compare/`) trois fichiers par écran :
   - `*-main.png` = copie de la référence actuelle (ne pas modifier `test/goldens/rider/*.png`)
   - `*-multistop.png` = capture candidate (rendu branche)
   - `*-diff.png` = image de différence
4. README court listant les 5 écrans + % pixel si dispo dans la sortie test.

**INTERDIT :** `--update-goldens`, overwrite des PNG de référence, accept_new_goldens.
Hors scope : F4-25/26/27 code. Auteur Papa Diop. Pas `.fullrun`. Timeout 25.
