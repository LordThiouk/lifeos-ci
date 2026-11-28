# E3 Forge — Rider goldens PR #33 (décision Papa 08:10)

Dépôt `Galass_Rider`, branche **`cursor/rider-lot-goldens-main-png-e410`** (PR #33).
ISA Rider MS : noter via ISATool sur `feat/multistop-rider-close-2026-11-20` / `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.
Flutter **3.44.8 uniquement** (3.50.1 invalide). **#25 interdite**. Pas de merge sans OK Papa. **Aucun `--update-goldens`**.

## Source PNG

Branche source multistop : **`feat/multistop-rider-close-2026-11-20`**.

Fichiers exacts présents au tip close (vérifié 08:19 UTC) :
- `test/goldens/rider/course_en_cours_f427_2_arrets.png`
- `test/goldens/rider/course_en_cours_f427_3_arrets.png`

## À faire (copie git only)

1. **Retirer** (bandeaux supprimés) : `course_en_cours_stop1_actif`, `course_en_cours_stop1_fait`, `course_en_cours_tous_arrets_faits` (+ refs tests).
2. **Garder** de `main` : `course_en_cours_simple` + `accueil`, `choix_service`, `composition_multistop`, `course_terminee`, `notation`, `rider_en_recherche`.
3. **Ajouter** les deux PNG `course_en_cours_f427_2_arrets` / `course_en_cours_f427_3_arrets` **copiés** depuis `feat/multistop-rider-close-2026-11-20` (pas de regen). Brancher les tests golden pour les charger.

## STOP

Si les deux PNG source disparaissent du tip close : STOP, pas de regen. Push PR #33. **STOP**.
