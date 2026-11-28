# Forge — Driver goldens option B (Papa 10:00)

Dépôt `Galass_Driver`, branche **`feat/lot-w2-driver`**.
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

Flutter **3.44.8** uniquement. Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

## Décision Papa

Option **B** : refaire la baseline des **4 PNG** `ride_details` absents de `main` (baseline 3.50.1 invalide vs rejeu 3.44.8) :

- `test/goldens/driver/goldens/driver_ride_running_single_stop.png`
- `test/goldens/driver/goldens/driver_ride_running_multistop_stop_1_active.png`
- `test/goldens/driver/goldens/driver_ride_running_multistop_stop_2_active.png`
- `test/goldens/driver/goldens/driver_ride_running_multistop_all_stops_done.png`

## Travail (un job = ce chantier)

1. ISATool Decisions : Papa 10:00 option B OK ; Flutter 3.44.8 ; absents de main ; **ne pas** toucher aux autres PNG (`driver_home_*`, `driver_review_*`, `driver_ride_completed`, etc.).
2. `flutter test --update-goldens test/goldens/driver/ride_details_golden_test.dart` sous **3.44.8**.
3. Rejeu `flutter test test/goldens/driver/ride_details_golden_test.dart` **vert** (les 4 ci-dessus ; `driver_ride_completed` inchangé sauf s’il échoue déjà — ne le regen pas).
4. Commit **séparé** : uniquement les 4 PNG (+ README empreinte si besoin) + Decisions ISA. Pas de `lib/`. Pas de `.fullrun`. Push branche. **STOP**.

## Interdits

Regen hors des 4 listés. Merge main. Autre ISC. Afficher la clé.
