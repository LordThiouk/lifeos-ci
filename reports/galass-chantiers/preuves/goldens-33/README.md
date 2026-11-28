# Goldens PR #33 — preuves PNG (tip `dbd2577`)

**Dépôt source :** `LordThiouk/Galass_Rider`  
**Tip :** [`dbd2577`](https://github.com/LordThiouk/Galass_Rider/commit/dbd2577) (PR [#33](https://github.com/LordThiouk/Galass_Rider/pull/33))  
**Baseline main :** commit [`21b9de4`](https://github.com/LordThiouk/Galass_Rider/commit/21b9de4) (« 10 PNG goldens officiels ») — le tip actuel de `main` n’a plus le dossier `test/goldens/rider/` (404 API).  
**Méthode :** copie octet-identique depuis le tip ; **aucune régénération**. **Pas de merge #33.**

## Les 9 PNG (dossier `tip/`)

| # | Fichier | Source | Commit source | Écart vs main (`21b9de4`) | Preuve |
|---|---------|--------|---------------|---------------------------|--------|
| 1 | `accueil.png` | tip #33 | `dbd2577` | **0,00 %** | `planches/accueil_main_branche_diff.png` |
| 2 | `choix_service.png` | tip #33 | `dbd2577` | **0,00 %** | `planches/choix_service_main_branche_diff.png` |
| 3 | `composition_multistop.png` | tip #33 | `dbd2577` | **0,00 %** | `planches/composition_multistop_main_branche_diff.png` |
| 4 | `course_en_cours_simple.png` | tip #33 | `dbd2577` | **0,00 %** | `planches/course_en_cours_simple_main_branche_diff.png` |
| 5 | `course_en_cours_f427_2_arrets.png` | tip #33 ← copie `85a2713` | `dbd2577` (blob = `85a2713`) | **N/A** (absent de main) | `planches/course_en_cours_f427_2_arrets_main_branche_diff.png` |
| 6 | `course_en_cours_f427_3_arrets.png` | tip #33 ← copie `85a2713` | `dbd2577` (blob = `85a2713`) | **N/A** (absent de main) | `planches/course_en_cours_f427_3_arrets_main_branche_diff.png` |
| 7 | `course_terminee.png` | tip #33 | `dbd2577` | **0,00 %** | `planches/course_terminee_main_branche_diff.png` |
| 8 | `notation.png` | tip #33 | `dbd2577` | **0,00 %** | `planches/notation_main_branche_diff.png` |
| 9 | `rider_en_recherche.png` | tip #33 | `dbd2577` | **0,00 %** | `planches/rider_en_recherche_main_branche_diff.png` |

Les **7** PNG présents sur la baseline officielle `21b9de4` sont à **0 %** (0 pixel différent / 1 507 920). Papa a demandé « 6 à 0 % » : les 7 commons le sont.

## Planche « course en cours »

`planches/course_en_cours_simple_vs_f427_2_3.png` — `course_en_cours_simple` (main) | `f427_2_arrets` | `f427_3_arrets`.

## Flutter 3.44.8 + contenu UI f427_*

| Affirmation | Preuve |
|-------------|--------|
| f427 générés / validés sous **Flutter 3.44.8** | Commit source [`85a2713`](https://github.com/LordThiouk/Galass_Rider/commit/85a2713) (F4-27 Arrêt N) ; rapport lifeos-ci `20261127-2015-f427-sot-source-verite.md` (« goldens f427_2/3 … Flutter 3.44.8 ») ; ISA `20261006-galass-rider-multistop` : tests contrat F4-27 sous Flutter 3.44.8 (2026-11-27). Tip #33 = **copie sans regen** (`dbd2577`). |
| Prise en charge | Visible : « Lieu de prise en charge » + adresse (lecture PNG tip). |
| Pointillés | Ligne verticale en pointillés rouge entre les étapes (lecture PNG tip). |
| Arrêt N | f427_2 : Arrêt 1, Arrêt 2 ; f427_3 : Arrêt 1, Arrêt 2, Arrêt 3. |
| Destination | Libellé « Destination » + adresse (icône violette). |
| Sans bandeau x/N | Absent sur les deux PNG. |
| Sans « En route vers » | Absent sur les deux PNG. |
| Sans bouton message | Seul téléphone + notes ; pas de bouton message. |

## SHA tip (vérif copie = GitHub)

- `accueil.png` sha256 `eeb71d688af3…` = tip GitHub `dbd2577`
- `course_en_cours_f427_2_arrets.png` sha256 `e18bc8948a66…` = tip GitHub `dbd2577`
