# Lot-client W4 Driver — photo / caméra (ISC-20.1 + 21.x)

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver`. ISA enfant : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope strict :**
1. ISC-20.1 — inscription n'avance pas sans photo + message FR (`flutter test` widget)
2. ISC-21 / 21.1 / 21.2 — capture caméra intégrée (profil, docs véhicule, permis) ; source image factice OK
3. ISC-21.3 — permission caméra refusée → message FR, pas de crash
4. ISC-21.4 — taille/format acceptés par l'API (test taille ≤ limite)

Hors scope : OTP (52), always-location (23), D-1 device (80), `flutter build`. Un ISC = un commit + test. ISATool tick. Auteur Papa Diop. Pas `.fullrun`.
