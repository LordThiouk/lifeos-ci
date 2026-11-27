# Driver — ISC-F5-18 regen goldens stop1≠stop2 (Papa 2026-11-27 01:50 Dakar)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15 @ tip `051b538` (+ suite). ISA : MEMORY/WORK/20261006-galass-driver-multistop/.

**Décision Papa (déblocage ISA)** : « Fais revues des deux isa… si y’a blocage tu debloque ». Blocage Verify×3 = F5-18 PNG encore byte-identiques alors que le rendu `completedAt` est déjà livré (`650944b`, test logique VERT). Autorisation explicite de **regen** sous Flutter **3.50.1** pour fermer F5-18.

Fais UNIQUEMENT :
1. Flutter **3.50.1** uniquement (pas 3.35 / 3.44).
2. `flutter test --update-goldens test/goldens/driver/ride_details_golden_test.dart`
3. Preuve : `sha256sum` stop_1_active ≠ stop_2_active ; `flutter test test/goldens/driver/ride_details_golden_test.dart` VERT.
4. ISATool : coche **ISC-F5-18** ; Decisions = Papa OK regen F5-18 2026-11-27 ; mets à jour Remaining Work **F6** si tous F5-12..19 prouvés.
5. Commit PNG + ISA. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas lib/ hors nécessité. Pas .fullrun. Pas flutter build.
