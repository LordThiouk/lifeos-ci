# E3 Forge — Rider lot ISC-85 caméra

Dépôt `Galass_Rider`, branche **`feat/lot-w2-rider`**.
ISA : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`.

Flutter **3.44.8**, aucun golden regen, pas de `flutter build`, pas `.fullrun`.
Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

## Scope

1. `profile_controller` / edit_profile : `ImageSource.camera` via service injectable ; **garder** FilePicker.
2. Manifest Android CAMERA ; iOS FR.
3. Test `test/core/camera/rider_profile_camera_test.dart` rouge→vert.
4. ISATool tick ISC-85 avec evidence test. Push. **STOP**.

Hors scope : device e2e ISC-83/84, #33 goldens, MS, main.
