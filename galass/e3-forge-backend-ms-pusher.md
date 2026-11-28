# E3 Forge — Backend MS Pusher ISC-39 / ISC-40

Dépôt `Galass_backend`, branche **`feat/multistop-e2e-2026-11-15`**.
ISA : `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md`.

Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`. Pas `.fullrun`. Pas secrets PSP.

## Scope

1. **Pusher n=0** — diagnostiquer et corriger la cause racine pour que `STOP_COMPLETED` soit bien publié sur `rider-user-{id}` (ISC-39/39.1/39.2). Preuve = test PHPUnit nommé exécutable en CI **ou** lecture + test local si possible.
2. **ISC-40** — citer/aligner nom de test exact ; tick ISATool si vert.
3. Ne pas merger PR CI #18. Ne pas deploy. Push feat. **STOP**.

## Hors scope

lot-client caméra, Flutter, Artemis, main, Verify.
