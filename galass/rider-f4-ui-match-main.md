# Mini Rider — écran course = main (retire bandeau + F4-25 notes)

Dépôt `Galass_Rider`, branche `feat/multistop-rider-close-2026-11-20`.
ISA multistop : l’écran course en cours **et** course terminée doit être **identique à main**.

## Correction Papa 27/11 16:02 Dakar
La ligne d’avancement en haut (**« En route vers… »**, **« 0/2 arrêt terminé »**, **« 2/2 arrêts terminés »**) **n’est PAS voulue**.

## Scope strict
1. **Retirer** le bandeau d’avancement / jambe courante sur **tous** les écrans course (ACTIVE / RUNNING / COMPLETED) :
   - `stopsProgressText` / compteur « x/N arrêt(s) terminé(s) »
   - `currentLegBanner` / « En route vers… »
   - rendu en tête de `RideDetailsBottomSheetWidget` (et tout autre widget sheet course qui l’affiche)
2. **Restaurer** la tuile « Des notes pour la prise en charge ? » en RUNNING (**ISC-F4-25**) — même place que main (à gauche du bouton appel).
3. **Goldens** : les PNG de `test/goldens/rider/course_en_cours_*.png` + `course_terminee.png` (référence main) restent la référence.
   - **INTERDIT** : `--update-goldens`, overwrite PNG, accept_new_goldens.
   - **Cible** : `flutter test test/goldens/rider/rider_ride_sheet_golden_test.dart` → **≈ 0 %** (verts) + `flutter test test/widget/course_en_cours_contract_test.dart --name 'ISC-F4-25'` vert.

## Preuve TDD
1. Coller sortie **rouge** (bandeau présent / notes absentes / goldens > 0 %).
2. Correctif minimal.
3. Coller sortie **verte** goldens course + F4-25.

## Hors scope
F4-26 / F4-27 (minis suivants), Artemis, regen goldens, `flutter build`.
ISATool tick F4-25 + Decision Papa « bandeau non voulu, UI = main ».
Auteur Papa Diop. Pas `.fullrun`. Timeout 25.
