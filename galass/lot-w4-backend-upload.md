# Lot-client W4 Backend — upload image limite (ISC-21.4)

Dépôt `Galass_backend`, branche `fullrun/lot-client-w0`. ISA parent : `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`.

**Scope strict :**
1. ISC-21.4 (partie backend) — limite taille/format acceptée pour upload photo chauffeur (profil/docs) ; PHPUnit : fichier ≤ limite → 200 ; au-dessus → 422 avec message clair.
2. Documenter la limite exacte (octets + mime) en Decisions pour le forge Driver.

Hors scope : Flutter, OTP, deploy, Verify. Un ISC = un commit + test. ISATool tick. Auteur Papa Diop. Pas `.fullrun`. Pas secrets PSP.
