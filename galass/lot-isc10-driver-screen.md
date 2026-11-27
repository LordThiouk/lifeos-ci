# Lot-client ISC-10 — écran unique Driver KYC (étapes 1–3)

Dépôt principal `Galass_Driver`, branche tip lot `feat/lot-w2-driver` (enfant ISA `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md` si présente ; sinon miroir parent).
Parent ISA déjà réécrit Mini-0 : ISC-10…10.3 ouverts (Driver écran unique).

Auteur : Papa Diop. Pas `flutter build` / gradle. Permis : `flutter test`, `flutter analyze`, `dart format`. Goldens : **relaunch only, jamais régénérer**.

## Étape 1 — Artemis AVANT (capture)
Capturer l’état actuel multi-écrans :
- `DriverProfileVerificationScreen` (permis)
- `VehicleVerificationScreen` (véhicule)
Artifacts nommés `isc10-before-permis.*` / `isc10-before-vehicule.*` (ou équivalent Artemis).
Ne pas modifier le code UI dans cette étape. Consigne Decision/Verification parent + enfant.

## Étape 2 — Forge UI un seul écran
Objectif ISC-10 / 10.1 :
- Un seul écran affiche **les deux formulaires** (sections permis + véhicule), scroll.
- **Mêmes champs**, mêmes validations client, **mêmes** appels API / repos (`DriverVerificationKycRepo` / `VehicleVerificationRepo`, URLs inchangées).
- Controllers existants réutilisés ; pas de fusion des payloads.
- Navigation post-auth : si `dv` ou `vv` manquant → cet écran unique (plus `Get.offAllNamed` séparé permis puis véhicule).
- Anti ISC-10.1 : diff repos sans changement d’endpoint/payload.

Preuves : `flutter test` (widget/écran) + `flutter analyze` clean sur fichiers touchés.
ISATool tick ISC-10 et ISC-10.1 sur preuve mesurée (enfant + rollup parent si contrat le demande).

## Étape 3 — Artemis APRÈS + goldens
- Capture après : permis + véhicule visibles sans multi-étapes (`isc10-after-kyc.*`).
- Relancer goldens existants (gate) — **interdire** toute régénération / overwrite de reference.
- Tick ISC-10.3 sur captures + relaunch goldens verts.
- ISC-10.2 : confirmer côté backend (déjà Mini-0) routes séparées toujours présentes ; pas de `approve.all`.

## Hors scope
approveAll (déjà retiré Mini-0), OTP, caméra, merge main, Verify×3 sans OK Papa.
