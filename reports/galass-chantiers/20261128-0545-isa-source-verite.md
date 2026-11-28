# QUESTION PAPA — Source de vérité des ISA (lecture seule)

**Daté :** 2026-11-28 05:45 Africa/Dakar  
**Périmètre :** inventaire RO — aucun code, aucun commit ISA, aucun merge, aucun push produit.  
**STOP** — pas de GO implicite E3/E4.

Progress = ligne frontmatter `progress:` (pas le simple compte de cases `[x]`). Tips = SHA GitHub live (`gh api` / PR head) au moment du rapport.

---

## Règle proposée (une ligne)

**La source de vérité d'une ISA = la branche canonique du chantier (`feat/multistop-rider-close-2026-11-20` | `feat/multistop-e2e-2026-11-15` | `feat/lot-w2-*` | `fullrun/lot-client-w0`), jusqu'à merge OK Papa sur `main`, puis `main` (archive) ; une slice `cursor/*` ne fait foi que pour les ISC qu'elle introduit, jusqu'à merge dans la canonique.**

---

## 1. Rider multistop — `20261006-galass-rider-multistop`

| Champ | Valeur |
|---|---|
| repo | `Galass_Rider` |
| chemin | `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md` |
| branche qui fait foi | **`feat/multistop-rider-close-2026-11-20`** |
| commit tip | **`0154446`** |
| progress | **30/39** (`phase: learn`) |
| PR liée | [#24](https://github.com/LordThiouk/Galass_Rider/pull/24) → `main` |
| dernière màj ISA | 2026-11-27 22:21 Africa/Dakar (`docs(isa): SoT tip SHA aligné…`) |

**Copies périmées à ne pas lire**

| Branche | Pourquoi |
|---|---|
| `main` @ `7984da7` — **23/26** | Snapshot oct. 2026 ; MS jamais mergé (revert backend #11). |
| `feat/multistop-e2e-2026-11-15` @ `ab3a434` — **42/42** | Piste parallèle « complete » ; **pas** la branche de clôture Papa (`*-close-*`). |
| `cursor/rider-frise-align-e410` (#34) — 30/39 | Même progress ISA que tip, mais base PR = `feat/multistop-e2e-*` (mauvaise base) ; code frise seulement. |
| `cursor/rider-active-poll-e410` / `cursor/rider-map-current-leg-e410` | PRs code empilées sur close ; ne redéfinissent pas le compteur ISA. |

---

## 2. Rider lot — `2026-11-22-galass-rider-lot-client`

| Champ | Valeur |
|---|---|
| repo | `Galass_Rider` |
| chemin | `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md` |
| branche qui fait foi (lot) | **`feat/lot-w2-rider`** |
| commit tip | **`462d48f`** |
| progress | **14/20** |
| PR liée | [#21](https://github.com/LordThiouk/Galass_Rider/pull/21) → `main` |
| dernière màj ISA | 2026-11-27 22:21 Africa/Dakar (untick Papa 22:12 + SoT) |

**Slice caméra (ISC-85 uniquement jusqu'à merge)**

| Champ | Valeur |
|---|---|
| branche | `cursor/lot-camera-isa-e410` |
| tip | `79e8bdc` — **18/23** |
| PR | [#32](https://github.com/LordThiouk/Galass_Rider/pull/32) → `feat/lot-w2-rider` |
| note | Ajoute ISC-85 ; **re-coche** aussi 22/83/83.2 que le tip SoT a untick faute e2e — **ne pas lire ce progress comme SoT lot**. |

**Copies périmées**

| Branche | Pourquoi |
|---|---|
| Ancien tip `542932e` (18/20, ISC-83/83.2 cochés) | Force-push SoT → `462d48f` après untick Papa (pas de preuve e2e device). |
| `cursor/rider-lot-goldens-main-png-e410` (#33) | Goldens PNG ; ISA figée sur 14/20, pas de ticks nouveaux. |
| `main` | Pas d'ISA lot (ou absente). |

---

## 3. Driver multistop — `20261006-galass-driver-multistop`

| Champ | Valeur |
|---|---|
| repo | `Galass_Driver` |
| chemin | `MEMORY/WORK/20261006-galass-driver-multistop/ISA.md` |
| branche qui fait foi | **`feat/multistop-e2e-2026-11-15`** |
| commit tip | **`5bac90e`** |
| progress | **22/22** (`phase: complete` ; Bridge-B7 `[ ]` hors compteur) |
| PR liée | [#4](https://github.com/LordThiouk/Galass_Driver/pull/4) → `main` |
| dernière màj ISA | 2026-11-27 22:21 Africa/Dakar |

**Copies périmées**

| Branche | Pourquoi |
|---|---|
| `main` @ `9b34386` — **18/18 CLOSED** | Sous-ensemble historique ; pas les Bridge/F5 post-oct. |
| `cursor/driver-remove-test-markers-e410` (#16) @ `482a772` — 22/22 | Code E1 + note F5-19 ; progress identique, **pas** nouveau SoT. |
| `cursor/driver-destination-golden-e410` (#14) | Fix UI Destination ; Decisions locales. |

---

## 4. Driver lot — `2026-11-22-galass-driver-lot-client`

| Champ | Valeur |
|---|---|
| repo | `Galass_Driver` |
| chemin | `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md` |
| branche qui fait foi (lot) | **`feat/lot-w2-driver`** |
| commit tip | **`7ebdffb`** |
| progress | **19/26** |
| PR liée | [#12](https://github.com/LordThiouk/Galass_Driver/pull/12) → `main` |
| dernière màj ISA | 2026-11-27 22:21 Africa/Dakar |

**Slice caméra (ISC-21…21.4 jusqu'à merge)**

| Champ | Valeur |
|---|---|
| branche | `cursor/lot-camera-isa-e410` |
| tip | `1ddae5b` — **14/27** |
| PR | [#15](https://github.com/LordThiouk/Galass_Driver/pull/15) → `feat/lot-w2-driver` |
| note | Papa 01:33 : **untick** ISC-21…21.4 (réouverture caméra). Progress ↓ vs tip lot = attendu. |

**Copies périmées :** toute lecture de ISC-21 `[x]` sur `feat/lot-w2-driver` sans la décision caméra — tip lot a encore 21.x cochés ; la slice camera les rouvre. **Pour l'état caméra aujourd'hui, lire #15.** Pour le reste du lot, lire #12.

---

## 5. Parent lot — `2026-11-22-galass-lot-client`

| Champ | Valeur |
|---|---|
| repo | **`Galass_backend` uniquement** (absent de Rider et Driver, `main` et `feat/lot-w2-*`) |
| chemin | `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md` |
| branche qui fait foi | **`fullrun/lot-client-w0`** |
| commit tip | **`2efa1a7`** |
| progress | **42/56** |
| PR liée | [#10](https://github.com/LordThiouk/Galass_backend/pull/10) → `main` |
| dernière màj ISA | 2026-11-27 22:21 Africa/Dakar |

**Slice caméra / miroir ISC-85 + untick 21.x**

| Champ | Valeur |
|---|---|
| branche | `cursor/lot-camera-isa-e410` |
| tip | `e67cc77` — **37/58** |
| PR | [#17](https://github.com/LordThiouk/Galass_backend/pull/17) → `fullrun/lot-client-w0` |
| contenu | +ISC-85 Rider ; ISC-21…21.4 décochés |

**Copies périmées**

| Branche | Pourquoi |
|---|---|
| `main` @ `7c6ee414` — **0/67** | Plan initial PR #9 ; jamais le tip de travail. |
| Chercher dans Rider/Driver | **N'existe pas** — Papa avait raison. |

---

## 6. Backend multistop — `20261006-galass-regression-multistop`

| Champ | Valeur |
|---|---|
| repo | `Galass_backend` |
| chemin | `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md` |
| branche qui fait foi | **`feat/multistop-e2e-2026-11-15`** |
| commit tip | **`caf4924`** |
| progress | **137/156** |
| PR liée | [#12](https://github.com/LordThiouk/Galass_backend/pull/12) → `main` |
| dernière màj ISA | 2026-11-27 22:21 Africa/Dakar |

**Copies périmées**

| Branche | Pourquoi |
|---|---|
| `main` — **95/125** | Post-revert merge PR #11 (2026-11-26) ; snapshot écrasé / ancien. |
| Copie locale cloud `992d308e` (137/157) | Tip antérieur au SoT tip SHA `caf4924` (137/**156**). |

---

## 7. Backend lot / miroir caméra (ISC-85, ISC-21.x)

Pas de slug séparé. **Même fichier parent** §5.

| ISC | Où lire aujourd'hui |
|---|---|
| ISC-21…21.4 (untick / réouverture) | `Galass_backend` `cursor/lot-camera-isa-e410` @ `e67cc77` + enfant Driver #15 |
| ISC-85 (Rider caméra profil) | Parent camera `e67cc77` **et** Rider camera `79e8bdc` |
| Rollup lot hors caméra | Parent `fullrun/lot-client-w0` @ `2efa1a7` |

Jusqu'à merge #17 → `fullrun/lot-client-w0`, le tip parent **42/56** ignore encore ISC-85 et garde 21.x cochés — **écart connu**.

---

## 8. ISA harnais emu — `20261123-galass-emu-golden-anti-regression` (ISC-EMU-*)

| Champ | Valeur |
|---|---|
| repo | `galass-emu-actions-pub` |
| chemin | `MEMORY/WORK/20261123-galass-emu-golden-anti-regression/ISA.md` |
| branche qui fait foi | **`cursor/artemis-visible-markers-e410`** (tip Artemis E1 ; contient l'ISA) — en pratique toute branche Artemis empilée depuis le commit ISA `b4b0c91` |
| commit tip branche | **`68af0c2`** |
| progress | **1/4** (ISC-EMU-4 localement prouvé ; EMU-1/2/3 ouverts) |
| PR liée | [#15](https://github.com/LordThiouk/galass-emu-actions-pub/pull/15) → `cursor/artemis-f427-pusher-e410` (#14 → `main`) |
| dernière màj ISA | 2026-11-23 06:23 Africa/Dakar |

**Copies périmées**

| Branche | Pourquoi |
|---|---|
| `main` | **ISA absente** — ne jamais lire main pour ISC-EMU. |
| Décisions code post-23/11 sans tick ISA | Harnais a bougé (textes visibles, F4-27) ; progress ISA **pas** réconcilié. |

---

## Miroir LifeOS (dual-write / ISC-F0-1)

| Point | Constat |
|---|---|
| Où | Convention MS : repo `MEMORY/WORK/{slug}/` **+** `~/.claude/LIFEOS/MEMORY/WORK/{slug}/` sur runner FullRun / box LifeOS. |
| Parent lot | Explicitement **sans** dual-write LifeOS (Decision 2026-11-22 dans l'ISA parent). |
| Cet environnement cloud | `~/.claude/LIFEOS/MEMORY/WORK/` = **STATE seul** — **pas** de miroir des 8 ISA. |
| SHA256 vs tip travail | **Non vérifiable ici** (miroir absent). Rider MS tip marque ISC-F0-1 `[x]` avec note « Nix / copie runner » — à re-hasher sur le runner qui a le miroir, pas depuis ce cloud. |
| MCP LifeOS | Indisponible (discovery error) — pas de lecture dual-write distante. |

---

## Enfant vs parent — qui fait foi en cas de conflit ?

1. **ISC d'un enfant** (Rider/Driver lot ou MS) → **tip enfant canonique** + preuve nommée.  
2. **Parent** = rollup / contrat transverse — ne « gagne » un tick enfant que après **reconcile ISATool** avec preuve.  
3. Si parent dit `[x]` et enfant tip dit `[ ]` (ex. ISC-21 caméra) → **l'enfant + slice camera font foi** jusqu'à reconcile.  
4. Si enfant dit `[x]` sans preuve device et parent/SoT a untick (ex. Rider ISC-83 sur camera vs lot tip) → **SoT tip canonique + décision Papa** font foi.

---

## Où ISATool écrit réellement

- Fichier cible = **chemin local passé en argv** (`ISATool.ts <op> <path/ISA.md>`).  
- Écrit **uniquement** ce path + met à jour `isa_stamp` HMAC (clé `ISA_STAMP_KEY` / `~/.claude/LIFEOS/MEMORY/STATE/.isa-stamp-key`).  
- **Pas** de push git, **pas** de dual-write auto vers LifeOS, **pas** de choix de branche magique.  
- En pratique FullRun : checkout **repo@branche-canonique** (lock 1 chantier) → ISATool → commit/push agents sur **cette** branche.  
- Cloud agent sans clé stamp → `provenance-mismatch` si édition ; d'où les ticks via runner / mini FullRun.

---

## Règle de fermeture / arrivée sur `main`

1. Cocher / clore **sur la branche canonique** via ISATool (jamais sur `main`, jamais seulement sur une `cursor/*` non mergée).  
2. Verify×3 → Max → **OK Papa merge**.  
3. **Ordre merge :** d'abord **multistop** (backend #12, Driver #4, Rider #24) → `main` ; ensuite **rebaser lot** (`feat/lot-w2-*`, `fullrun/lot-client-w0`) sur `main` ; puis merge lot.  
4. Slices `cursor/*` (camera, frise, markers, Artemis) → merge **dans** la canonique **avant** close, ou close après absorb.  
5. Après merge : tip `main` devient archive SoT ; progress figé.

---

## Écarts connus (cause)

| Écart | Cause |
|---|---|
| Rider MS 23/26 (`main`) vs 30/39 (close) vs 42/42 (e2e) | Trois histoires : main figé ; close = chantier Papa ; e2e = piste complete parallèle. |
| Rider lot 14/20 (SoT) vs 18/23 (camera) vs ancien 18/20 (`542932e`) | Untick Papa 22:12 (pas e2e) force-push tip ; camera fork avec re-ticks + ISC-85. |
| Driver lot 19/26 vs camera 14/27 | Tip lot garde 21.x `[x]` ; Papa 01:33 rouvre caméra sur slice. |
| Parent 42/56 vs camera 37/58 | Même untick 21.x + ajout ISC-85 sur slice non mergée. |
| Backend MS 95/125 (`main`) vs 137/156 (tip) | Revert PR #11 + reprise chantier sur feat. |
| Backend MS 137/157 → 137/156 | Rewrite Remaining / SoT tip SHA 22:21. |
| Driver MS 18/18 vs 22/22 | main archive ; tip ajoute Bridge/F5. |
| Emu 1/4 figé depuis 23/11 | Code harnais a évolué sans reconcile ISA. |
| Frise #34 base `feat/multistop-e2e` | PR ouverte sur mauvaise base vs SoT close. |

---

## Tableau récap SoT (à coller)

| # | ISA | Repo | Branche foi | Tip | Progress | PR |
|---|---|---|---|---|---|---|
| 1 | Rider MS | Galass_Rider | `feat/multistop-rider-close-2026-11-20` | `0154446` | 30/39 | #24 |
| 2 | Rider lot | Galass_Rider | `feat/lot-w2-rider` (+ camera #32 pour ISC-85) | `462d48f` | 14/20 | #21 |
| 3 | Driver MS | Galass_Driver | `feat/multistop-e2e-2026-11-15` | `5bac90e` | 22/22 | #4 |
| 4 | Driver lot | Galass_Driver | `feat/lot-w2-driver` (+ camera #15 pour 21.x) | `7ebdffb` | 19/26 | #12 |
| 5 | Parent lot | **Galass_backend** | `fullrun/lot-client-w0` (+ #17 caméra) | `2efa1a7` | 42/56 | #10 |
| 6 | Backend MS | Galass_backend | `feat/multistop-e2e-2026-11-15` | `caf4924` | 137/156 | #12 |
| 7 | Caméra / ISC-85 | même parent + Rider/Driver camera | `cursor/lot-camera-isa-e410` | e67 / 79e / 1dd | 37/58 · 18/23 · 14/27 | #17 #32 #15 |
| 8 | Emu ISC-EMU | galass-emu-actions-pub | `cursor/artemis-visible-markers-e410` | `68af0c2` | 1/4 | #15 |

---

**STOP.** Rapport seul. Pas d'E3/E4.
