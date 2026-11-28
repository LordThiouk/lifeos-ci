# E3 Forge — Driver lot caméra + ISC-22

Dépôt `Galass_Driver`, branche **`feat/lot-w2-driver`**.
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

Flutter **3.44.8**, aucun golden regen, pas de `flutter build`, pas `.fullrun`.
Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

## Scope

1. **ISC-21…21.4** — `image_capture_service` (ou équivalent) : `ImagePicker().pickImage(source: ImageSource.camera, …)` ; brancher ProfileController / VehicleVerification / DriverKyc / edit_profile. **Enlever** retrait Android `CAMERA` (`tools:node="remove"`). Permission refusée → message FR, pas de crash. **Garder** upload/galerie.
2. Tests : `test/core/camera/profile_camera_test.dart`, `vehicle_docs_camera_test.dart`, `license_camera_test.dart`, `camera_denied_test.dart`, `capture_size_test.dart` (créer si absents) — rouge puis vert.
3. **ISC-22/22.1** — refresh borné (pas seulement resume) ; test rouge→vert nommé.
4. ISATool tick uniquement avec preuves `flutter test …` nommées. Push. **STOP**.

## Hors scope

Artemis, goldens regen, MS, merge main, PHPUnit CI #18.
