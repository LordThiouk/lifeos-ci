# ISATool — décisions Papa 09:20 (noter, ne pas coder)

Un job = **un chantier**. Branche canonique. Compteurs = frontmatter de cette branche, jamais `main`.  
ISATool seul. Commit `docs(isa)`. Push. **STOP**. Pas de code. **Aucun tick device** sans capture tierce. Ne jamais lire/afficher/régénérer `ISA_STAMP_KEY`.

## Décisions communes

1. **Goldens PR #33** — Papa a **vu et validé** les 9 PNG (tip images `dbd2577`). Tête ensuite `3f9e8c0` = docs ISA seulement ; puis merge dans `feat/lot-w2-rider` @ `ecdc998` (après rebase `2cd0c5c`). 7 commons = **0 %** vs main `21b9de4` ; f427_* absents de main, source `85a2713` / Flutter **3.44.8**, **jamais régénérés**. `f427_*` aussi sur `feat/multistop-rider-close` = **mêmes blobs** → pas de conflit de contenu si les deux branches rejoignent `main`.
2. **PHPUnit** — `galass-ci` #25 MERGED (`phpunit.yml` + `README` seulement) ; run lancé ubuntu-latest. Backend #18 **non mergée**.
3. **Artemis B** — run `46126465934` **FAIL** p0=17/30 ; GLES dégradé → **STOP** (déjà rapporté). Lane A après tip Rider MS ≠ `a5ed36f`.
4. **Autosave wip** — PR lifeos-ci #44 déjà MERGED (`_agent-run.yml` + `autosave-deny.txt`).
5. **Driver 4 goldens** — échecs absents de `main` ; options Papa (échec connu ISA / baseline 3.44.8 après OK) — **ne pas régénérer** dans ce job.

## Texte Decisions (adapter au chantier)

### Goldens / Rider lot (`feat/lot-w2-rider`)

> **2026-11-28 09:20 Africa/Dakar — Papa :** goldens PR #33 **validés** (9 PNG vus). Tip images `dbd2577` ; commit `3f9e8c0` = docs ISA seulement (PNG inchangés octet pour octet). Merge #33 → `feat/lot-w2-rider` (`ecdc998`). 7 commons 0 % vs `21b9de4` ; f427_* Flutter 3.44.8, jamais régénérés. **Pas de coche device.**

### Driver lot

> **2026-11-28 09:20 — Papa :** unit OK ; ISC-21…22.1 **device NON VALIDÉ**. 4 goldens `ride_details_*` : échec connu branche (baseline 3.50.1 vs 3.44.8), absents de main — **ne pas regen** sans OK.

### Parent / Backend MS / Rider lot ISC-85

Inchangé vs 08:50 : HOLD device Parent ; Backend ISC-39/40 passés ; Rider ISC-85 unit seulement.
