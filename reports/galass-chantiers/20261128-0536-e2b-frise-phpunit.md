# E2b — Corrections frise + PHPUnit — 2026-11-28 05:36 Africa/Dakar

**STOP** après corrections. Pas E3, pas Artemis, pas merge/push main.

## 1. FRISE

| | |
|---|---|
| Règle finale | **gris si fait, orange sinon** (pin) ; textes : gris+barré si fait, couleurs normales sinon — **pas de muted « à venir »** |
| Commit | Rider `cursor/rider-frise-align-e410` (suite E2) |
| Tests | `multistop_itinerary` + `course_en_cours_contract` **19/19** (3.44.8) |
| Planche STOP1 FAIT | `preuves/e2-frise/planche_frise_driver_rider_STOP1_FAIT.png` (Driver \| Rider, arrêt 1 terminé / 2 orange) |
| Goldens | **aucune regen** |

## 2. GOLDENS

Rien changé (bases acceptées confirmées Papa).

## 3. PHPUnit

### a) Zombies annulés (OK Papa)

| Repo | Résultat |
|---|---|
| **Galass_backend** | **21/21** runs PHPUnit queued ≥6h → `cancelled` (dont `46076191162`) |
| Galass_Rider | 0 zombie PHPUnit |
| Galass_Driver | 0 zombie PHPUnit |
| galass-ci / lifeos-ci | 0 zombie PHPUnit |

(Les « 3 repos » concernés côté triggers = PRs MS/lot/forge qui spammaient **Galass_backend** uniquement.)

### b) `test.yml` → `ubuntu-latest`

Branche `cursor/phpunit-ubuntu-latest-e410` (base `main`) — `runs-on: ubuntu-latest` + `timeout-minutes: 30`, comme `galass-ci/phpunit.yml`.

## Ce que je n’ai pas pu prouver

| Manque | Comment |
|---|---|
| PHPUnit VERT sur ubuntu-latest | relancer un run après merge/CI de la branche `cursor/phpunit-ubuntu-latest-e410` |
| Validation visuelle Papa sur planche STOP1_FAIT | Papa ouvre `planche_frise_driver_rider_STOP1_FAIT.png` |

## STOP

Attente GO E3 / validation planche frise.
