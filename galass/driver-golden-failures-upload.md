# Driver — upload PNG golden failures (Papa 2026-11-26, image+diff avant OK regen)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15.

Fais UNIQUEMENT ceci :
1. `flutter test test/goldens/driver/ride_details_golden_test.dart` (sans `--update-goldens`).
2. Collecte les PNG sous `test/goldens/driver/failures/` (et tout mask/diff produit par golden_toolkit).
3. Copie-les aussi à la racine du dépôt sous `_golden_failures_upload/` (baseline + masterImage + isolatedDiff si présents) pour que la CI les voie en artifact / commit.
4. Commit **uniquement** `_golden_failures_upload/**` (pas les goldens de référence, pas de lib/) avec message `chore(evidence): golden failures ride_details pour revue Papa`.
5. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun ni ISA.

But : produire les images d'échec pour revue Papa — **ne régénère pas** les goldens de référence.
