# Driver — regen goldens ride_details (OK Papa 2026-11-26 Dakar)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/.

**Décision Papa : REGEN + régler le problème golden.** Cause racine : Artemis tournait en Flutter **3.44.8** alors que les baselines exigent **3.50.1** (README goldens). Artemis est aligné / en cours d'alignement sur 3.50.1 — régénère sous **Flutter 3.50.1 uniquement**.

Fais UNIQUEMENT :
1. ISATool **Decisions** : Papa OK regen 2026-11-26 ; cause = mismatch Flutter 3.44.8 (Artemis) vs baseline 3.50.1 ; fix = alignement Artemis 3.50.1 + regen sous 3.50.1.
2. Installe / utilise Flutter **3.50.1** (pas 3.35.x, pas 3.44.x).
3. `flutter test --update-goldens test/goldens/driver/ride_details_golden_test.dart` puis `flutter test test/goldens/driver/ride_details_golden_test.dart` vert.
4. Commit PNG + README si l'empreinte change + Decisions. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas lib/ produit. Ne touche pas .fullrun.
