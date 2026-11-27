# Lot-client ISC-10 — Étape 2 seule : Forge UI écran unique KYC Driver

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver` tip ≥ `de737f0` (Étape 1 PASS — captures AVANT `test/artifacts/isc10/isc10-before-permis.png` + `isc10-before-vehicule.png`).
Enfant ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.
Parent (rollup) : `Galass_backend@fullrun/lot-client-w0` tip ≥ `2a59ba8` — `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md` (ISC-10…10.3 ouverts ; ISC-11…11.3 retirés Papa 27/11).

**Scope strict — Étape 2 uniquement.** Ne pas capturer Artemis APRÈS (Étape 3). Ne pas relancer/régénérer goldens de référence. Ne pas toucher ISC-23 / OTP / caméra.

## Objectif ISC-10 / ISC-10.1
Un seul écran Driver affiche **les deux formulaires** (sections permis + véhicule), scrollable :
- **Mêmes champs**, mêmes validations client, **mêmes** appels API / repos (`DriverVerificationKycRepo` / `VehicleVerificationRepo`, URLs inchangées).
- Controllers existants réutilisés ; **pas** de fusion des payloads.
- Navigation post-auth : si `dv` ou `vv` manquant → cet écran unique (plus `Get.offAllNamed` séparé permis puis véhicule).
- Anti ISC-10.1 : `git diff` repos sans changement d'endpoint / payload.

## Preuves
- Test rouge → vert (widget/écran) prouvant permis + véhicule visibles sur **un** écran.
- `flutter test` ciblé + `flutter analyze` clean sur fichiers touchés.
- ISATool tick **ISC-10** et **ISC-10.1** (enfant Driver ; rollup parent si le contrat l'exige) uniquement sur preuve mesurée.
- Ne pas cocher ISC-10.2 / ISC-10.3 (Étape 3).

## Hors scope
Étape 3 Artemis APRÈS, goldens regen/overwrite, approveAll (déjà retiré Mini-0), OTP, caméra, localisation ISC-23, merge main, Verify×3 sans OK Papa.

Auteur Papa Diop. Pas `flutter build` / gradle. Permis : `flutter test`, `flutter analyze`, `dart format`.
