# Goldens Rider lot après copie PNG officiels main — 04:19 Africa/Dakar

Flutter **3.44.8** — **aucune régénération**.  
Branche : `cursor/rider-lot-goldens-main-png-e410` @ `8c25dbb` → base `feat/lot-w2-rider` (`462d48f`).  
Source PNG : commit `21b9de4` (officiels main).  
Planches écarts restants : `preuves/e1-rider-lot-goldens-after-main-png/`.

## Driver 2–4 px

**ROUGE toléré connu** — confirmé Papa (inchangé).

## Action faite

| | |
|---|---|
| Copiés (10) | `accueil`, `choix_service`, `composition_multistop`, `course_en_cours_simple`, `course_en_cours_stop1_actif`, `course_en_cours_stop1_fait`, `course_en_cours_tous_arrets_faits`, `course_terminee`, `notation`, `rider_en_recherche` |
| Non touché | `course_active_avant_prise_en_charge.png` (absent de main / `21b9de4`) — **Q Papa** |
| Rejeu | `flutter test test/goldens/rider` → **+5 −6** |

## VERT après copie (5)

| golden | |
|---|---|
| `rider_en_recherche` | PASS |
| `accueil` | PASS |
| `choix_service` | PASS |
| `composition_multistop` | PASS |
| `notation` | PASS |

→ les 11 ROUGE « raster 3.50.1 » d’E1 sont **éliminés** sur ces 5 + les échecs restants sont **vrais changements d’écran** (sauf `course_active`).

## Écarts restants (6) — vrais changements

| golden | Flutter | Ce qui change (rendu lot vs officiel main) | ISC lié |
|---|---|---|---|
| `course_en_cours_simple` | **21,04 % / 317205 px** | Bannière « En route vers … » ; **icône message** à côté de l’appel ; décalage vertical feuille | **F4-26** (message) ; bannière course |
| `course_en_cours_stop1_actif` | **28,00 % / 422283 px** | Idem + **frise complète** pickup / Arrêt 1 / Arrêt 2 / Destination (main n’avait que l’arrêt actif) | **F4-27** ; F4-26 |
| `course_en_cours_stop1_fait` | **27,99 % / 422024 px** | Même famille frise complète + message + bannière | **F4-27** ; F4-26 |
| `course_en_cours_tous_arrets_faits` | **27,99 % / 422113 px** | Même famille | **F4-27** ; F4-26 |
| `course_terminee` | **4,55 % / 68667 px** | Contenu timeline présent des deux côtés ; écart dense (AA + micro-décalages sur toute la feuille « Course terminée » / bouton Avis) | surface fin de course / F4-27 héritage |
| `course_active_avant_prise_en_charge` | **0,02 % / 328 px** | PNG **lot-only** (pas sur main) ; écart type bande SOS AA vs baseline lot 3.50.1 | **Q Papa** — ne rien créer |

Planches : `preuves/e1-rider-lot-goldens-after-main-png/<name>_board.png`.

## Q Papa

1. **`course_active_avant_prise_en_charge`** : absent de main — **que faire ?** (garder PNG lot / retirer le golden / autre) — **rien créé**.
2. Les 5 ROUGE « vrais » (simple / stop1×3 / terminee) : **accepter comme dette F4-26/27 sur tip lot** (porter PNG depuis tip MS `0154446` qui est VERT) / autre ?

## Prouvé / non prouvé / manque

| | |
|---|---|
| **Prouvé** | 10 PNG = `21b9de4` ; rejeu 3.44.8 +5−6 ; 5 VERT ; 5 écarts UI réels F4-26/27 ; course_active 328 px lot-only |
| **Non prouvé** | Décision course_active ; fusion PR goldens |
| **Manque** | GO pour E3.g (prochaine étape) |

## Suite

**STOP.** Prochaine = **E3.g** (Rider stuck RUNNING / pusher n=0 / UI_END=0 + texte réel capture 38) sur ton GO déjà donné — démarrage après ack de cette étape si tu confirmes l’ordre, sinon j’attends.
