# E2 — Frise + goldens + PHPUnit — 2026-11-28 05:16 Africa/Dakar

**Flutter** : 3.44.8 uniquement. **Aucun golden régénéré. Aucun PNG copié dans les repos.**  
**STOP** après E2 — pas E3, pas Artemis, pas merge, pas push main.

## 1. FRISE — alignement Rider → look Driver

| | |
|---|---|
| Rider tip base | MS `0154446` → branche `cursor/rider-frise-align-e410` @ `ff674bd` |
| Driver réf. | `components/timeline/ride_itinerary_timeline.dart` detailed |
| Changements | titres `regularDefault` fontSmall ; adresses `boldLarge` fontNormal ; **gris + barré** si fait ; pin **orange** actif / **muted** à venir / gris fait ; **Divider** après pickup ; espacements space4/5 |
| États conservés | actif / fait / à venir / tronçon en cours (`isActive`) |
| Composant partagé | **non** |
| En route / message / x/N | déjà absents sur tip MS `0154446` (vérifié code) |

### Planches Driver \| Rider (2 arrêts, arrêt 1 actif)

| Planche | chemin |
|---|---|
| Driver \| Rider AVANT | `preuves/e2-frise/planche_frise_driver_rider_AVANT.png` |
| Driver \| Rider APRÈS | `preuves/e2-frise/planche_frise_driver_rider_APRES.png` |
| Rider AVANT \| APRÈS | `preuves/e2-frise/planche_frise_rider_avant_apres.png` |
| Sheet SOS AVANT \| APRÈS | `preuves/e2-frise/planche_sheet_sos_avant_apres.png` |

Tests : `multistop_itinerary_test` + `course_en_cours_contract` → **19/19 PASS** (SOS F4-28 inclus).  
PR frise : à ouvrir sur base `feat/multistop-e2e-2026-11-15`.

## 2. GOLDENS — base acceptée par écran

### Inventaire tip Rider MS `0154446` (vérifié `git ls-tree`)

Présents : `course_en_cours_f427_2_arrets.png`, `course_en_cours_f427_3_arrets.png`, `course_en_cours_simple.png`, `course_terminee.png`, `accueil`, `choix_service`, `composition_multistop`, `notation`, `rider_en_recherche`.

**`course_en_cours_stop1_actif.png` n’existe pas** au tip MS `0154446`.  
**Ne pas dire** que le MS « respecte » main sans preuve pixel — les PNG `stop1_*` / `tous_arrets_faits` sont côté **lot**, pas MS.

### Base acceptée (par écran)

| Écran | Branche / tip | Base acceptée | Note |
|---|---|---|---|
| `accueil` | lot `8c25dbb` / main `21b9de4` | **PNG officiels main** | VERT 3.44.8 après copie (E1) |
| `choix_service` | idem | **PNG officiels main** | VERT |
| `composition_multistop` | idem | **PNG officiels main** | VERT |
| `rider_en_recherche` | idem | **PNG officiels main** | VERT |
| `notation` | idem | **PNG officiels main** | VERT |
| `course_en_cours_simple` | lot vs main | **écart réel UI** (pas accepté comme = main) | F4-26/bandeau historique lot ; MS tip sans bandeau |
| `course_en_cours_stop1_actif` | lot only | **frise F4-27** (pas PNG main équivalent nommé ainsi) | absent MS `0154446` |
| `course_en_cours_stop1_fait` | lot only | **frise F4-27** | idem |
| `course_en_cours_tous_arrets_faits` | lot only | **frise F4-27** | idem |
| `course_en_cours_f427_2_arrets` | MS `0154446` | **frise F4-27** (golden MS) | base frise, pas stop1_actif |
| `course_en_cours_f427_3_arrets` | MS `0154446` | **frise F4-27** | idem |
| `course_terminee` | lot vs main | **PNG main** + écart dense ~4,5 % | planche E1 |
| `course_active_avant_prise_en_charge` | **RETIRÉ** | — | Papa E2 : retiré du lot (`392f003`, PR #33) |

### Planches main \| branche \| diff

Sans nouvelle copie PNG / sans regen — planches déjà produites E1 (3.44.8) :

`preuves/e1-rider-lot-goldens-after-main-png/<écran>_board.png`  
(et `goldens-compare/` pour la série antérieure).

SOS (F4-28) : visible sur planche sheet + test widget `MyStrings.sos` **PASS** ; crop `rider_sheet_sos_crop_*.png`.

## 3. BACKEND PHPUnit — cause queue 6h+

| | |
|---|---|
| Run | `46076191162` (et **≥10** autres PHPUnit queued 6–13 h) |
| Workflow | `.github/workflows/test.yml` → `runs-on: [self-hosted, galass-box]` |
| Job | `test` — `labels: ["self-hosted","galass-box"]` — `runner_name: ""` — **jamais assigné** |
| Cause | **Aucun runner GitHub Actions `galass-box` online** pour prendre les jobs. La file s’accumule (lot + MS). Ce n’est pas un quota GitHub-hosted ; c’est un **self-hosted offline / busy / deregistered**. |
| Livelog | **absent** (`fullrun-logs/*460761*` n’existe pas) — normal : le job n’a jamais démarré. |
| Corroboration | `galass-ci/.github/workflows/phpunit.yml` commente déjà « runner self-hosted galass-box offline » et tourne sur `ubuntu-latest` (PR #25). |

### Correctif proposé (sans exécution — OK Papa requis)

1. Sur la box `galass-box` : vérifier le service `actions.runner` / `./run.sh` du runner GitHub ; redémarrer si down ; confirmer labels `self-hosted` + `galass-box`.
2. Annuler les runs PHPUnit zombie (queued >6 h) pour débloquer la file — **irréversible pour ces run_ids** → besoin OK Papa.
3. Aligner `Galass_backend/.github/workflows/test.yml` sur `ubuntu-latest` (comme `galass-ci/phpunit.yml`) — **OK Papa requis**.
4. Ne pas confondre avec les Cursor self-hosted workers (pools vides ici) — labels GHA ≠ Cursor agent workers.

**Aucune relance** effectuée.

## 4. Ce que je n’ai pas pu prouver

| Manque | Comment obtenir |
|---|---|
| Pixel-proof SOS sur émulateur réel | E4 Artemis capture chiffrée |
| Runner `galass-box` online | Papa / ops redémarre le runner VPS |
| Goldens MS stop1_actif vs main | N/A — fichier absent tip MS ; comparer `f427_2_arrets` si Papa valide une base |
| Aikido scan | MCP non auth |

## Questions Papa (signalées)

1. Ordre merge MS → lot rebasé.  
2. GO staging / migration.  
3. Merge pin Flutter 3.44.8 dans main harnais.  
4. OK pour cancel PHPUnit zombies + restart `galass-box` ?

## STOP

E2 clos. Attente GO pour E3.
