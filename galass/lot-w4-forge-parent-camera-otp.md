# Lot-client W4 — Forge tick parent caméra/OTP

Dépôt `Galass_backend`, branche `fullrun/lot-client-w0`.
ISA : `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`.

**Prérequis :** carry Serena `lot-w4-serena-parent-camera-otp` signé étapes 1–3 ; head = tip.

**Scope strict — ISATool tick uniquement** (pas de code Flutter) sur preuves enfants déjà mesurées :

- ISC-5, ISC-22, ISC-22.1, ISC-51, ISC-53 (Rider tip `542932e`)
- ISC-20.1, ISC-21, ISC-21.1, ISC-21.2, ISC-21.3, ISC-21.4 (Driver tip `9ce4efe` + BE upload)

Chaque tick : `--evidence` cite la commande/test enfant + SHA (copier depuis carry / Verification enfant). Mettre à jour `progress`. `ISATool verify` OK.

**Hors scope :** ISC-10/11, ISC-23, Artemis, merge. Auteur Papa Diop. Pas `.fullrun`.
