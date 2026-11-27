# Mini Rider — ISC-F4-25 tuile notes RUNNING (multistop)

Dépôt `Galass_Rider`, branche `feat/multistop-rider-close-2026-11-20`.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md` (ou chemin ISA F4 contract présent).

**Scope strict — F4-25 seul.**
Restaurer la tuile « Des notes pour la prise en charge ? » (`MyStrings.anyPickUpNotes`) visible sur l'écran course en cours (`RIDE_RUNNING`) multistop.

Preuve TDD :
1. `flutter test test/widget/course_en_cours_contract_test.dart --name 'ISC-F4-25'` → **rouge** avant correctif (coller sortie).
2. Correctif minimal UI (`ride_details_bottom_sheet_widget` / `shouldShowPickupNotesTile` / montage hors garde trop stricte).
3. Même test → **vert**.

**Anti :** ne pas régénérer de golden PNG. Ne pas toucher F4-26/F4-27 (minis séparés). Pas `flutter build`/gradle.
ISATool tick F4-25 sur preuve. Auteur Papa Diop. Pas `.fullrun`. Timeout ≤ 25.
