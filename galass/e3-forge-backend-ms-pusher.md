# E3 Forge — Backend MS contrat STOP_COMPLETED (sans toucher l’émission)

Dépôt `Galass_backend`, branche **`feat/multistop-e2e-2026-11-15`**.
ISA : `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md`.

**Prérequis :** carry tip frais étapes 1–3 pass (`start_step=build`). Aucun commit entre carry et ce build.

Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`. Pas `.fullrun`. Pas secrets PSP.

## Scope

1. **Test de contrat** `STOP_COMPLETED` uniquement : canal `private-rider-user-{id}`, nom d’événement, enveloppe (clés payload). PHPUnit nommé exécutable.
2. **Ne pas modifier** le code d’émission / broadcast existant.
3. ISC-40 : aligner nom de test ; ISATool tick seulement avec preuve verte.
4. Push feat. **STOP**.

## Hors scope

Changer l’émission Pusher ; Rider Bridge-F17-3 (autre dépôt) ; lot caméra ; merge #18 ; deploy ; Artemis.
