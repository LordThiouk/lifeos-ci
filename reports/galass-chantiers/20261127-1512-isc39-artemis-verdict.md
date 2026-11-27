# Point — 2026-11-27 ~15:11 Africa/Dakar

**Branche :** `cursor/reports-galass-chantiers-e410` · PR [#35](https://github.com/LordThiouk/lifeos-ci/pull/35)

---

## Jalons

| # | Item | Run / SHA | Résultat |
|---|---|---|---|
| 2 | ISC-39 parent tick | [46021321708](https://github.com/LordThiouk/lifeos-ci/actions/runs/46021321708) | **SUCCESS** tip MS `992d308e` · progress **137/157** · ISC-39 `[x]` (rollup 39.1–3 + F4-12) |
| 7 | Artemis MS | [46007813326](https://github.com/LordThiouk/galass-emu-actions-pub/actions/runs/46007813326) | **FAIL** 25 fails · P0 **10/30** · `emulator_unstable=false` |
| — | Driver location | [46015568574](https://github.com/LordThiouk/lifeos-ci/actions/runs/46015568574) | **FAIL** `OC_STATUS=timeout` rc=124 · Push OK tip `9ce4efe` (wip) |
| — | Rider signup | [46016448020](https://github.com/LordThiouk/lifeos-ci/actions/runs/46016448020) | **SUCCESS** tip `07ff0bc5` · progress **16/20** (ISC-22/22.1) |
| 4 | Semantics/EMU-1 | [46022577573](https://github.com/LordThiouk/lifeos-ci/actions/runs/46022577573) | **in_progress** Driver@`feat/multistop-e2e-2026-11-15` |
| 5a | Rider-83 | (dispatch 15:11) | **in_progress** Rider@`feat/lot-w2-rider` |
| 1b | Forge backend upload | [46021105072](https://github.com/LordThiouk/lifeos-ci/actions/runs/46021105072) | **in_progress** livelog ~128k · PHPUnit photo tests (flake 3 failed puis rejeu) |

---

## Verdict Artemis 46007813326 — fails classés

**Config note :** workflow a tourné avec `RIDER_ID=106` / `DRIVER_ID=23` (≠ contrainte Papa ids >900000). Ride `324` uid `52AGZ8CBIK`.

### A. Harnais (pas un bug produit)

| Point | Preuve |
|---|---|
| `rider-home-after` | « not attempted (harness) » — skip cascade |
| `push-probe` WARN | « delta sans uid => non attribuée (jamais PASS) » |
| `bug-b7-push` WARN | « unattributed: delta_pkg=1 mais 0 notification portant l'uid » |
| `b2-captures` | marker harness / TIMEOUT dérivé |
| `rider-cash-methods` | duplicate-state dump = home (harness state machine) |
| IDs 106/23 | hardcodés dans `artemis-staging-e2e.yml` — hors contrat >900000 |

### B. Émulateur

| Point | Preuve |
|---|---|
| `emulator-boot` / `emulator-calm` | **PASS** · `emulator_unstable=false` |
| TIMEOUTs UI massifs | **symptôme** post-échec assign (écrans course jamais atteints) — pas d'instabilité boot |

→ **Pas de classe « émulateur instable »** pour ce run.

### C. Vrai bug / produit (racine)

| Point | Preuve |
|---|---|
| **`diag-driver-assign`** | `offer-expired` (remark=offer_expired att=20 bal=3178.4 online=1) asg=0 |
| Cascade in-ride / stops / cash / rating | marqueurs absents car course jamais acceptée à temps |
| `diag-rider-pusher` | n=0 événements Pusher côté rider |
| `bug-b3-final-timeline` WARN | timeline 0 nœuds (conséquence) |
| `UI_ACCEPT=0` … `UI_CASH=0` | aucun tap métier confirmé |

**Racine :** acceptation offre trop lente / expired (B7 timing) → cascade 20 P0 non-PASS. Correctif attendu : accept avant expiry (branche `cursor/b7-offer-accept-before-expiry-e410` / harness) + Artemis sur ids >900000 + push-probe uid.

---

## Progress tip

| Chantier | tip | progress |
|---|---|---|
| Lot parent | `974f93a9` | 38/64 |
| Lot Rider | `07ff0bc5` | **16/20** |
| Lot Driver | `9ce4efe` | 15/26 |
| MS backend | `992d308e` | **137/157** |

---

## Suite file Papa

| # | Item | État |
|---|---|---|
| 1 | Forge upload | en vol 460211 |
| 2 | ISC-39 | **DONE** |
| 3 | FCM 61.x / ISC-50 | **bloqué** tant qu'Artemis ids 106/23 + push non attribuable |
| 4 | Semantics/EMU-1 | en vol 460225 |
| 5 | Rider-83 puis 84 | 83 dispatché ; 84 après PASS 83 |
| 6 | Rollup caméra/OTP | après forge upload PASS |
| 7 | Artemis verdict | **DONE** (ce fichier) |

Verify×3 / merge = **OK Papa only**. Pas de secrets.

