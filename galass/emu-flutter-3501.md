# emu — aligner Flutter Artemis sur 3.50.1 (OK Papa golden 2026-11-26)

Dépôt galass-emu-actions-pub, branche feat/multistop-e2e-2026-11-15.

Problème : Artemis pin `flutter-version: "3.44.8"` alors que les goldens Driver exigent **Flutter 3.50.1 · Dart 3.14.0** (`Galass_Driver/test/goldens/driver/README.md`) → Pixel test 4–6 px (0,00 %).

Fais UNIQUEMENT : dans `.github/workflows/artemis-staging-e2e.yml` (et tout autre workflow e2e/golden du dépôt qui pin Flutter pour les tests unitaires Rider/Driver), passe `flutter-version` à **`3.50.1`** (channel stable). Pas d'autre changement. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push.
