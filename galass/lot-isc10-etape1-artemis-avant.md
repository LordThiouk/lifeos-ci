# Lot-client ISC-10 — Étape 1 seule : Artemis AVANT (KYC multi-écrans)

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver`.
Parent ISA (déjà Mini-0) : `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md` sur `Galass_backend@fullrun/lot-client-w0` tip ≥ `c7a0be0`.
Enfant Driver si présent : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope strict — Étape 1 uniquement.** Ne pas coder l'écran unique (Étape 2). Ne pas relancer goldens (Étape 3).

## Objectif
Capturer l'état **actuel** multi-écrans KYC Driver (baseline avant refactor) :
- écran permis : `DriverProfileVerification` / flux `driverVerificationFormUrl`
- écran véhicule : `VehicleVerification` / flux `vehicleVerificationFormUrl`

Artifacts : `isc10-before-permis.*` et `isc10-before-vehicule.*` (screenshot widget test, golden harness, ou dump Artemis). Committer sous `docs/` ou `test/artifacts/isc10/` sur la branche Driver, sans toucher UI métier.

Documenter dans Decisions/Verification (ISATool append uniquement) : chemins artifacts + SHA tip.

## Hors scope
Forge UI un seul écran, goldens regen, approveAll (déjà retiré Mini-0), OTP, caméra, merge, Verify×3.

Auteur Papa Diop. Pas `flutter build`/gradle. Permis : `flutter test`, `flutter analyze`, captures.
