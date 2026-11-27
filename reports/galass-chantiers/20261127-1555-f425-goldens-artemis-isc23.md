# Point — F4-25/26/27 + goldens planche + Artemis 460276 + ISC-23

Date: 2026-11-27 15:55 Africa/Dakar

## 1. Artemis 460276 (rider figé `d989ed1e`)

| Champ | Valeur |
|---|---|
| Run | https://github.com/LordThiouk/galass-emu-actions-pub/actions/runs/46027600691 |
| Harnais | `b073d55` · rider **`d989ed1e`** (checkout OK) · driver `feat/multistop-e2e-2026-11-15` · staging garde OK · ids 900106/900023 |
| Verdict P0 device | **N/A — E2E non atteint** |

### Fails classés
| # | Où | Détail | Classe |
|---|---|---|---|
| 1–4 | **Driver** unit goldens | `driver_ride_running_*.png` — **0.00 % / 2–4 px** | bruit pixel Driver (pas Rider F4) |
| — | Rider @ d989ed1e | unitaires **PASS** | OK (contrat/goldens course absents à ce SHA) |

APK + E2E skipped → **offre / assign / geo&lt;500 / stops Driver non observés**.  
**Aucune regen** goldens. Relance E2E P0 nécessite Driver goldens verts (hors bruit) ou skip gate Driver — décision Papa.

## 2. Mini builds lancés

| Mini | run | cible | état |
|---|---|---|---|
| **F4-25** tuile notes | [46028637215](https://github.com/LordThiouk/lifeos-ci/actions/runs/46028637215) | Rider `@feat/multistop-rider-close-2026-11-20` | in_progress |
| **F4-26** message | *après F4-25* | idem | file |
| **F4-27** liste arrêts | *après F4-26* | idem | file |
| **ISC-23** location | [46028637513](https://github.com/LordThiouk/lifeos-ci/actions/runs/46028637513) | Driver `@feat/lot-w2-driver` timeout 25 | pending/in_progress |
| **ISC-23.1** | *après 23* | timeout 25 | file |
| Planche goldens (forge) | [46028912828](https://github.com/LordThiouk/lifeos-ci/actions/runs/46028912828) | Rider MS-close | pending (doublon local ci-dessous) |

Repro local tip MS (`bf9dcb6`, Flutter 3.44.8) : F4-25/26/27 **tous rouges** (notes / `rider-message-button` / « Marché Castors » introuvables) — minis justifiés.

## 3. Goldens course — planche main | multistop | diff (**sans regen**)

Référence = PNG tip (import main `7984da7`). Multistop = `*_testImage` (rendu branche). Diff = `*_isolatedDiff`.  
Pourcentages Artemis 460259 / local identiques.

| Écran | écart | Planche côte à côte |
|---|---|---|
| `course_en_cours_simple` | 19.20 % | ![simple](/opt/cursor/artifacts/goldens-compare/course_en_cours_simple_board.png) |
| `course_en_cours_stop1_actif` | 27.33 % | ![actif](/opt/cursor/artifacts/goldens-compare/course_en_cours_stop1_actif_board.png) |
| `course_en_cours_stop1_fait` | 27.31 % | ![fait](/opt/cursor/artifacts/goldens-compare/course_en_cours_stop1_fait_board.png) |
| `course_en_cours_tous_arrets_faits` | 27.33 % | ![tous](/opt/cursor/artifacts/goldens-compare/course_en_cours_tous_arrets_faits_board.png) |
| `course_terminee` | 8.31 % | ![terminee](/opt/cursor/artifacts/goldens-compare/course_terminee_board.png) |

Fichiers aussi sous `reports/galass-chantiers/goldens-compare/*_board.png` (+ `*_main` / `*_multistop` / `*_diff`).  
**Papa valide écran par écran** avant toute acceptation de nouvelle référence — agent **n’a rien régénéré**.

## 4. Suite
- Enchaîner F4-26 → F4-27 à chaque PASS.
- ISC-23.1 après ISC-23 PASS.
- Artemis device P0 : bloqué tant que Driver 4 goldens 2–4 px rouges (sauf OK Papa pour stratégie).
