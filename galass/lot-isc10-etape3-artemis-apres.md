# Lot-client ISC-10 — Étape 3 seule : Artemis APRÈS + goldens relaunch

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver` tip ≥ `db8ad6a` (`DriverKycScreen` Étape 2 livrée).
Enfant ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope strict — Étape 3 uniquement.** Papa OK 2026-11-27 17:52 Africa/Dakar.

## Objectif
1. Captures **APRÈS** : un seul écran KYC avec permis + véhicule visibles (`isc10-after-kyc.*` sous `test/artifacts/isc10/` ou équivalent Aditi) — sans multi-étapes.
2. **Relancer** les goldens Driver existants (gate) — **INTERDIT** `--update-goldens`, regen, overwrite de PNG de référence.
3. ISATool tick **ISC-10.3** (et ISC-10.2 si preuve routes séparées / pas `approve.all` déjà documentée) sur captures + relaunch verts.

## Ordre obligatoire (anti-timeout)
1. Captures APRÈS + `flutter test` goldens **sans** update
2. **ISATool tick** sur preuve
3. **git push**
4. **STOP** immédiat

## Hors scope
Étape 1/2 (déjà faites), OTP, caméra, localisation, merge main, Verify×3 sans OK. Pas `flutter build`. Pas `.fullrun`. Auteur Papa Diop. Timeout ≤ 40.
