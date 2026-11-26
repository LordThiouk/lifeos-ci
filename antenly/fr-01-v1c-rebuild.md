# Antenly FR-01 — rebuild V1 après Verify BLOCK (2026-11-26)

Dépôt antenly, branche **build/fr01-v1c** (copie isa/fr-01-vera-2026-11-26 @ 1bbf95b). ISA : `MEMORY/WORK/2026-11-02-fr-01-ingestion-live/ISA.md`.

Verify CR BLOCK : **ISC-22** liste en dur ; **ISC-13** trou d’heure. Silas PASS. Corrige UNIQUEMENT ces points bloquants V1 (schéma/migrations/fenêtres). Preuves : migrate + pytest ISC-22 / ISC-12 / couverture ISC-13. Coche ISC via ISATool seulement si preuve verte.

Ne commence pas V2. Pas de revue. Aucune URL/IP/clé. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`. Ne lis pas `evidence/`, `kuna_*.c`, `match_*.md`.
