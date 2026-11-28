# E3 Forge — Rider goldens PR #33 (décision Papa 08:10)

Dépôt `Galass_Rider`, branche **`cursor/rider-lot-goldens-main-png-e410`** (PR #33).
ISA Rider MS : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md` (noter la décision via ISATool).
Flutter **3.44.8 uniquement** (3.50.1 invalide). **#25 interdite**. Pas de merge sans OK Papa.

## À faire (git only — pas de regen)

1. **Retirer** (bandeaux supprimés, jamais régénérés) :
   - `course_en_cours_stop1_actif`
   - `course_en_cours_stop1_fait`
   - `course_en_cours_tous_arrets_faits`
   (PNG + références tests associés).
2. **Garder** de `main` (0 % d'écart) : `course_en_cours_simple` + les 6 autres main : `accueil`, `choix_service`, `composition_multistop`, `course_terminee`, `notation`, `rider_en_recherche`.
3. **Ajouter** `f427_2_arrets` et `f427_3_arrets` **depuis** la branche multistop (`feat/multistop-e2e-2026-11-20` / close), **sans régénérer**.

## STOP obligatoire si absents

Si `f427_2_arrets.png` / `f427_3_arrets.png` **n'existent pas** sur la branche multistop source : **STOP immédiat**, consigner dans ISA (ISATool Decisions) « f427_2/3_arrets absents — pas de regen sans OK Papa ». Ne rien inventer, ne pas lancer `flutter test --update-goldens`.

## Règles

ISATool seul pour coches. Push sur la branche PR #33. **STOP**. Pas de merge main.
