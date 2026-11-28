# SoT S — Backend MS : ISATool ISC-40 nom de test

Dépôt `Galass_backend`, branche **`feat/multistop-e2e-2026-11-15`** (PR SoT #12).
ISA : `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md`.

Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`. Pas de `.fullrun`. Pas secrets PSP.

## Scope (ISATool)

1. ISC-40 : aligner libellé / Test Strategy sur le **vrai nom de test** PHPUnit au tip (chercher `ServiceOrderVisibilityTest` ou équivalent au tip — citer le chemin exact trouvé).
2. Ne pas inventer de nouveau test ce job. Si le test n'existe pas → Decisions BLOCK + ne pas cocher.
3. Si déjà prouvé et ouvert → tick avec evidence = chemin + méthode. Push. **STOP**.

## Hors scope

Pusher fix code (E3), deploy, Verify, lot-client, main, merge CI #18.
