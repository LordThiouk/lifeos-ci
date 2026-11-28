# E3 Serena — Driver lot carry (caméra + ISC-22)

Dépôt `Galass_Driver`, branche **`feat/lot-w2-driver`** (PR #12).
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Plan only** — carry signé étape 3 (build) pour Aditi/Forge. Ne pas coder. Ne pas cocher ISC.

Périmètre build suivant :
- ISC-22/22.1 refresh borné (pas seulement resume)
- ISC-21…21.4 vraie caméra (`image_capture_service`, `ImageSource.camera`) : profile_image, driver_kyc, vehicle_verification, edit_profile ; retirer `tools:node="remove"` CAMERA Android ; iOS NSCameraUsageDescription **FR** ; message FR si refus ; **garder upload/galerie**

Décisions Papa : caméra en plus upload ; Flutter 3.44.8 ; pas de marqueurs test.
Auteur Papa Diop. Pas `.fullrun`. **STOP** après carry + push.
