# Galass — localisation de l'ISA des bugs (2026-11-25)

## 1. Objet, acces et methode (constats de ce run)

Job `find-bugs-isa`, run lifeos-ci `45709578395` (2026-11-25T22:01:18Z),
cible `lifeos-ci@fix/extra-repos-full`, `lifeos_write=false`. Lecture seule.

Acces reels de ce run (verifies) :

- `event.json` du run : inputs `target_repo`, `branch`, `prompt_path`,
  `job_name`, `lifeos_ref` — **aucune entree `extra_repos`** : aucun depot
  Galass prive n'est clone ici (pas de dossier `extra/` dans le workspace).
- Aucun jeton disponible (`env` sans `GH_TOKEN`/`GITHUB_TOKEN`/`CI_TOKEN`,
  pas de `~/.netrc` ni `~/.config/gh`) ; `gh` est refuse par le sandbox.
- `git ls-remote https://github.com/LordThiouk/<repo>.git` :
  `Galass_Rider`, `Galass_Driver`, `Galass_backend` → `could not read
  Username` (prives) ; `galass-ci`, `galass-emu-actions-pub` → OK.
- API GitHub publique : les 3 depots prives renvoient 404 ; la liste
  publique `users/LordThiouk/repos` (27 repos, 2 pages) ne contient que
  **deux** repos dont le nom contient `galass` : `galass-ci`,
  `galass-emu-actions-pub`. Aucun autre miroir public.
- Logs d'Actions : endpoint `/logs` → 403 sans jeton.
- Consequence : les depots prives ne sont pas inspectables directement ce
  run ; leurs donnees viennent uniquement de rapports publies dans
  `galass-ci` par des runs qui avaient les clones.

Recherches executees ce run :

- clones complets dans `/tmp/galass-ci` (20 refs) et `/tmp/galass-emu`
  (10 refs) : `git log --all --diff-filter=A -- '*ISA*' '*BUGS*'`,
  `git grep` sur **toutes** les refs (`refs/remotes` + `refs/heads`),
  `git log --all --format ... --name-only` trié sur `isa|bug|triage|memory`.
- inventaire complet des runs publics : lifeos-ci 162, galass-ci 116,
  galass-emu-actions-pub 178 (2 pages chacun).
- `lifeos/` (clone lecture seule, `main` @ `e0d8c74`, 2026-11-23) :
  grep `MEMORY/WORK` sur `BUGS.md|triage|lot client|bugs-triage` → aucun
  hit ; pas de dossier `.claude/PAI`.

Rapports utilises comme sources indirectes (dans `galass-ci`) :

- `GALASS-PARALLEL.md` @ `33ad198` (2026-11-25 12:35:33 +0000) ;
- `GALASS-STATE.md` @ `52d8aa2` (2026-11-25 11:42:51 +0000) ;
- `GALASS-STATE.md` version ancienne @ `9be4268`
  (« docs: état galass avant fullrun », 2026-11-25 10:40:00 +0000) ;
- historique de `galass-ci` et de `lifeos-ci` (prompts, runs).

## 2. Candidats

| # | Depot / branche | ISA (chemin exact) | Dernier commit | Phase / progress | ISC | Vera ? | Source |
|---|---|---|---|---|---|---|---|
| C1 | `Galass_backend` `docs/bugs-triage-2026-11-22` | **aucune ISA** (seul `docs/BUGS.md`) | `c40c30d`, date non revérifiable (branche 2026-11-22) | n/a | ISA parente multistop : 124/156, 34 (39) ouverts | non (aucun run) | rapport |
| C2 | `Galass_backend` `main` (exéc. `fullrun/lot-client-w0`) | « lot client », chemin exact inconnu | `main` `2aa0dcd1` (état du 2026-11-25 10:40) | `plan`, 0/67 | 0 coché / 67 ouverts | non (run annulée) | rapport + API |
| C3 | `Galass_Rider` `fix/multistop-close` | `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md` | `5b2533f`, date non revérifiable | 25/27 (rapport) — 28/39 (état 11:42) | 5 ouverts (rapport) / 11 F4 + B3/B7 | non (aucun run) | rapport |
| C4 | `Galass_Driver` `fix/multistop-close` | `MEMORY/WORK/20261006-galass-driver-multistop/ISA.md` | `fe153c0`, date non revérifiable | 14/17 (rapport) — 14/20 (état 11:42) | 13 ouverts (rapport) / 7 F5 | non (aucun run) | rapport |
| C5 | `galass-emu-actions-pub` `feat/multistop-rider-close-2026-11-20` | `MEMORY/WORK/20261123-galass-emu-golden-anti-regression/ISA.md` | `b4b0c91` 2026-11-23 06:23:55 +0000 | `plan`, 1/4 | 1 coché / 14 non cochés | non sur `b4b0c91` | **direct** |
| C6 | `galass-ci` `fix/porte-carry-perime-2026-11-24` | aucune | `70f35d5` 2026-11-24 03:29:07 +0000 | n/a | n/a | non | **direct** |

### C1 — `Galass_backend` / `docs/bugs-triage-2026-11-22` @ `c40c30d`

- Seul candidat non multistop dont le nom correspond a l'indice
  `docs/bugs-triage-2026-11-22` (deux rapports indépendants donnent le meme
  SHA : `docs/bugs-triage-2026-11-22` (c40c30de) dans `GALASS-STATE` 10:40,
  `docs/bugs-triage` @ c40c30d (+8 vs `main`) dans `GALASS-PARALLEL` 12:35).
- `GALASS-PARALLEL.md` : la branche « ne touche que `docs/BUGS.md`, aucun
  code » et **ne contient pas d'ISA**.
- ISA parente (multistop, hors perimetre) :
  `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md` — 124/156 et
  34 ISC ouverts (`GALASS-STATE` 11:42) ; 95/125 et 39 ouverts a 10:40 ;
  39 ouverts dans `GALASS-PARALLEL` 12:35.
- Vera : aucune trace. Inventaire complet ce run : aucune run (lifeos-ci 162,
  galass-ci 116) ne cible `docs/bugs-triage` ni `Galass_backend` depuis
  lifeos-ci ; depuis `galass-ci`, `Galass_backend` n'a ete cible que par
  `feat/multistop-e2e-2026-11-15` (36 runs) et `fullrun/lot-client-w0` (1).

### C2 — `Galass_backend` / ISA « lot client » 0/67

- Source exacte : `GALASS-STATE.md` au commit `9be4268` (2026-11-25 10:40) :
  « Galass_backend : main 2aa0dcd1 (ISA lot client 0/67, plan) ; ... branches
  `fix/multistop-notifs` (3820b623), `docs/bugs-triage-2026-11-22`
  (c40c30de) ». La version courante `52d8aa2` (11:42) ne la reproduit plus.
- Chemin exact du fichier `MEMORY/WORK/<slug>/ISA.md` non recuperable depuis
  ce run (depot prive, logs 403).
- Branche d'execution `fullrun/lot-client-w0` ; run `galass-ci` `45058681462`
  « FullRun galass-lot-client-w0 → Galass_backend@fullrun/lot-client-w0 »,
  2026-11-22T19:04:52Z, `conclusion: cancelled` (verifie via API publique) →
  Vera n'a pas termine.
- Lien avec `docs/BUGS.md` non prouve : « lot client » ne dit pas « bugs ».
  Le declenchement est postérieur au meme jour que la branche de triage
  (2026-11-22), coïncidence a confirmer dans le depot prive.

### C3 — `Galass_Rider` / `fix/multistop-close` @ `5b2533f`

- ISA `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md` : 25/27 et 5 ISC
  ouverts (Bridge-B3, ISC-F4-8, F4-3.4, device ACTIVE, Bridge-B3 staging)
  selon `GALASS-PARALLEL` ; 28/39 et 11 ISC F4 ouverts selon `GALASS-STATE`.
- Branche issue de `main` le 2026-10-12 ; date du head non revérifiable.
- Vera n'y est jamais passe (aucune run cible `fix/multistop-close`).
- **Multistop : hors perimetre.**

### C4 — `Galass_Driver` / `fix/multistop-close` @ `fe153c0`

- ISA `MEMORY/WORK/20261006-galass-driver-multistop/ISA.md` : 14/17 et 13
  ISC ouverts (Bridge-B6, F5-5/12/13, Anti-F5-4, dettes A1-A7, preuves
  device) selon `GALASS-PARALLEL` ; 14/20 selon `GALASS-STATE`.
- Branche issue de `main` le 2026-10-10 ; date du head non revérifiable.
- Aucune run cible `fix/multistop-close`.
- **Multistop : hors perimetre.**

### C5 — `galass-emu-actions-pub` / ISA EMU (verifie directement)

- Fichier confirme par lecture : `MEMORY/WORK/20261123-galass-emu-golden-anti-regression/ISA.md`
  sur `feat/multistop-rider-close-2026-11-20` @ `b4b0c91`
  (2026-11-23 06:23:55 +0000) ; front-matter `phase: plan`,
  `progress: 1/4`, `updated: 2026-11-23T06:23:46Z` ; 1 ISC `[x]`,
  14 ISC `[ ]`.
- Cette ISA est la **seule** qui existe dans les deux depots publics :
  `git log --all --diff-filter=A -- '*ISA*'` n'en trouve aucune autre
  (`galass-ci` n'a jamais porte de fichier ISA).
- Vera : commit `308decf` « wip: vera - porter ISA harnais + fixer contrat
  ISC-EMU-1 content-desc » (2026-11-23 22:38:35 +0000) sur
  `feat/multistop-e2e-2026-11-15`, pas sur `b4b0c91`. Les runs emu sur
  `feat/multistop-rider-close` (25) sont `artemis-staging-e2e` /
  `stop-confirm-probe`, pas des FullRun Vera.
- **Multistop/emu : hors perimetre « bugs hors multistop ».**

### C6 — `galass-ci` / `fix/porte-carry-perime-2026-11-24`

- `70f35d5` (2026-11-24 03:29:07 +0000), « fix(carry): restaurer le carry
  signé le plus récent... ». Aucune ISA dans tout l'historique de `galass-ci`.
  Correction ponctuelle, hors sujet.

### Ecarts negatifs verifie ce run

- `galass-ci` : aucun fichier `MEMORY/WORK/**` ni `*ISA*` sur aucune des 20
  refs ; `BUGS.md`/`bugs-triage` n'apparaissent que dans `GALASS-PARALLEL.md`.
- `galass-emu-actions-pub` : un seul ISA (C5).
- `lifeos@main` : aucune ISA parlant de `BUGS.md`/triage ; les ISA Galass de
  `MEMORY/WORK` sont anciennes (juillet-octobre 2026) et hors de ce lot.
- Aucune run publique `isa-human-tick` (0 run) qui relierait un nom d'ISA.

## 3. Synthese

1. Aucune ISA « bugs » n'est verifiable directement : les depots prives sont
   inaccessibles de ce run (pas d'`extra_repos`, pas de jeton, `gh` refuse,
   API 404) et les depots publics n'en portent aucune.
2. Le seul candidat non multistop est C1 (`docs/bugs-triage-2026-11-22`) :
   il porte `docs/BUGS.md`, donc le perimetre des bugs, mais **aucun fichier
   ISA** n'y est repertorie.
3. La seule ISA existante non multistop est C2 (« lot client », `plan` 0/67,
   `Galass_backend@main`), sans lien prouve avec `BUGS.md`, et son FullRun
   Vera est annule.
4. C3, C4, C5 sont multistop : hors perimetre.
5. Vera n'est encore passee sur aucune branche candidate (inventaire de 278
   runs publics).

## 4. Verdict

**Branche a utiliser pour lancer Vera : `Galass_backend` `docs/bugs-triage-2026-11-22`
@ `c40c30d` ; ISA : il n'en existe pas encore sur cette branche, Vera doit la
creer sous `MEMORY/WORK/<slug>/ISA.md` a partir de `docs/BUGS.md` (chemin a
passer en `isa_path` une fois cree).**

Vera n'y est pas encore passee. Ne pas reutiliser
`MEMORY/WORK/20261006-galass-regression-multistop/ISA.md` (multistop,
124/156, 34-39 ISC ouverts) : hors perimetre. Si le « lot client » (C2)
s'avere etre ce lot de bugs, l'ISA existe alors deja (`Galass_backend@main`
`2aa0dcd1`, `plan` 0/67) et Vera doit etre relancee depuis `plan` sur
`fullrun/lot-client-w0` — mais ce lien n'est pas etabli et ne peut pas l'etre
depuis ce run.
