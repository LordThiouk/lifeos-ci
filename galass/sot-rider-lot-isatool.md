# SoT S — Rider lot : ISATool ISC-85 + SoT

Dépôt `Galass_Rider`, branche **`feat/lot-w2-rider`** (PR SoT #21).
ISA : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`.

Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
Flutter **3.44.8**, aucun golden regen, pas de `flutter build`, pas de `.fullrun`, scope strict.

## Décisions Papa

- Photo = **caméra téléphone EN PLUS** de l'upload/galerie.
- Ce que Papa a décoché (ISC-22/83/84 device sans e2e) **reste** décoché.
- Ne pas merger la slice camera #32 entière (elle re-coche 22/83) — **ISATool seulement** ici.

## Scope (ISATool only — pas de code Flutter ce job)

1. Append / replace : ajouter **ISC-85** ouvert (caméra photo profil Rider, `ImageSource.camera` + garder FilePicker) si absent du tip SoT.
2. Decisions datée Papa 01:33 / 28/11 : caméra profil ; slice #32 non mergée volontairement (ticks device incorrects) ; code caméra = E3.
3. Progress recalculé. Push feat. **STOP**.

## Hors scope

Code caméra, goldens #33, MS, Verify, main.
