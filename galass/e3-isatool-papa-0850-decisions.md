# ISATool — décisions Papa 08:50 (noter, ne pas coder)

Un job = **un chantier** (dispatcher séparément). Branche **canonique** du chantier. Compteurs = frontmatter de cette branche, jamais `main`.  
ISATool seul. Commit `docs(isa)`. Push. **STOP**. Pas de code produit. **Aucun tick** sans preuve tierce. Ne jamais lire/afficher/régénérer `ISA_STAMP_KEY`.

## Décisions communes (Papa 08:50)

1. **Goldens PR #33** — 9 PNG tip `dbd2577` déposés lifeos-ci `reports/galass-chantiers/preuves/goldens-33/` (copie sans regen). 7 commons vs main `21b9de4` = **0 %**. f427_* source `85a2713` / Flutter 3.44.8 ; UI : prise en charge, pointillés, Arrêt N, Destination ; sans x/N, sans En route, sans message. **Ne pas merger #33.**
2. **PHPUnit** — PR concernée = **`galass-ci` #25** (pas `Galass_Rider` #25). Backend #18 **ne pas merger**. Lancement bloqué tant que `phpunit.yml` pas sur `galass-ci` main.
3. **Driver lot** tip `b5c79a0` — unit OK (Forge `46125278404`) ; ISC-21…21.4, 22, 22.1 **device NON VALIDÉ**. 4 goldens `ride_details` FAIL sur branche ; **absents de Driver main** → pas régression vs main.
4. **Parent lot** tip `449b622` (rollup `46126465682`) — **aucun HOLD levé** ; ISC-21…22.1 restent HOLD.
5. **Autosave wip** — PR lifeos-ci #44 MERGED (`_agent-run.yml` + `autosave-deny.txt` seulement).
6. **Artemis** — lane B `46126465934` en cours ; lane A après tip Rider MS. Flutter 3.44.8 ; ids > 900000 ; STOP quota/émulateur.

## Texte Decisions à consigner (adapter au chantier du dispatch)

### Si Driver lot (`Galass_Driver` @ `feat/lot-w2-driver`, ISA `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`)

> **2026-11-28 08:50 Africa/Dakar — Papa :** unit OK tip `b5c79a0` (Forge lifeos-ci `46125278404`, 641 PASS + 4 goldens `ride_details_*` préexistants branche). ISC-21, 21.1, 21.2, 21.3, 21.4, 22, 22.1 = **device NON VALIDÉ** — captures Artemis lane B requises ; **ne pas cocher**. Les 4 PNG golden n’existent pas sur Driver `main` (`9b34386`) → pas de régression tip vs main.

### Si Rider lot (`Galass_Rider` @ `feat/lot-w2-rider`)

> **2026-11-28 08:50 Africa/Dakar — Papa :** ISC-85 = **unit seulement** (preuve appareil absente). Ne pas inventer de tick device. Goldens #33 hors merge.

### Si Backend MS (`Galass_backend` @ `feat/multistop-e2e-2026-11-15`)

> **2026-11-28 08:50 Africa/Dakar — Papa :** ISC-39/40 **passés** (Forge `46123923052`, tip `ef56625`). Backend #18 ne pas merger. PHPUnit produit = `galass-ci` #25 (en attente OK merge infra).

### Si Parent lot (`Galass_backend` @ `fullrun/lot-client-w0`, ISA `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`)

> **2026-11-28 08:50 Africa/Dakar — Papa :** rollup caméra `46126465682` → tip `449b622` ; progress FM **37/58**. **Aucun HOLD levé.** ISC-21…21.4 et ISC-22/22.1 restent **HOLD / NON VALIDÉ** (preuve device Artemis absente).

### Si Goldens #33 (`Galass_Rider` @ `cursor/rider-lot-goldens-main-png-e410`)

> **2026-11-28 08:50 Africa/Dakar — Papa :** tip `dbd2577` — 9 PNG copiés lifeos-ci `preuves/goldens-33/` (0 % vs main `21b9de4` pour les 7 commons ; f427_* depuis `85a2713` Flutter 3.44.8). **Pas de merge #33. Pas de regen.**

Compteurs : lire et rapporter le frontmatter `progress` de la branche canonique du job après Decision.
