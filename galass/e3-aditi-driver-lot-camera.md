# E3 Aditi — Driver lot UI caméra

Dépôt `Galass_Driver`, branche **`feat/lot-w2-driver`**.
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

Carry Serena E3 tip requis. Flutter **3.44.8**, aucun golden regen, pas de `flutter build`, pas `.fullrun`.
Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

## Scope UI

1. Entrées UI « Prendre une photo » (caméra) **en plus** de galerie/upload sur : profile_image, écrans KYC/permis, vehicle_verification, edit_profile.
2. Copy FR permission refusée.
3. iOS `NSCameraUsageDescription` en français.
4. Ne pas retirer FilePicker/galerie.

Forge enchaînera service + tests. ISATool ticks seulement avec preuve — préférer laisser Forge cocher. Push. **STOP**.
