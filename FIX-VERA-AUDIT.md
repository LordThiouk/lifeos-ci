# FIX-VERA-AUDIT — fr-plan-vera « erreur » (runs 45727313456 et 45729541863)

Contexte : branche lifeos-ci `fix/extra-repos-full`, workflow `fr-plan-vera.yml`
(job `lot-client-vera-audit`, cible `Galass_backend@fullrun/lot-client-w0`, prompt
`prompts:galass/lot-client-vera-audit.md`). Les deux runs ont tourné sur
lifeos-ci@d6279f0, avant le correctif 5f42b95.

## Run 45729541863 — échec en moins d'une seconde (modèle mimo)

**Cause** : l'étape « Validation des entrées » échoue sur la vérification de
présence du modèle. Le pipeline `quota.sh list | grep -qxF` tourne sous
`set -o pipefail` : `grep -q` s'arrête à la première correspondance, `quota.sh`
reçoit SIGPIPE et le pipeline renvoie 141 ; la branche
`|| fail "model absent de models.txt"` se déclenche alors que le modèle est bien
présent (ligne 4 de `models.txt`).

**Preuve** :
- Annotation du job 139607838957, étape 4 « Validation des entrées » :
  `model absent de models.txt` (horodatage 2026-11-26T00:33:16Z, échec immédiat).
- Code fautif `d6279f0:.github/workflows/_agent-run.yml:191-192` :
  `quota.sh list ... | grep -qxF -- "$IN_MODEL" || fail ...`.
- Reproduction locale :
  `( set -o pipefail; quota.sh list models.txt | grep -qxF -- opencode/mimo-v2.6-flash-free )`
  → `rc=141` (2000/2000 essais).

**Correctif (5f42b95, vérifié ici)** :
- `grep -xF ... >/dev/null` (sans `-q`) lit tout le flux : plus de SIGPIPE
  (500/500 OK).
- Normalisation du nom court : `mimo-v2.6-flash-free` →
  `opencode/mimo-v2.6-flash-free` avant validation (`model_norm`,
  `_agent-run.yml:190-219`).

## Run 45727313456 — 16 min puis OC_STATUS=erreur, aucun commit

**Cause** : opencode s'exécute (étape 13, 00:15:15→00:31:59, 16 min 44 s) puis
rend la main sans commit ni `/tmp/task_done.md` ; l'ancien code n'avait ni
bascule sur erreur ni journal de sortie, donc l'étape 16 échoue avec
`OC_STATUS=erreur`. Le prompt impose l'édition de l'ISA via `ISATool.ts` ; or
l'environnement FullRun ne fournissait ni `bun` (absent du `PATH` de
`env -i` : /usr/local/bin, /usr/bin, /bin) ni le socle ISA inscriptible
`~/.claude/LIFEOS` (`lifeos/` est monté lecture seule et `ISATool.ts` écrit
`~/.claude/LIFEOS/MEMORY/STATE/.isa-stamp-key`). Vera ne pouvait donc pas
exécuter l'outil ni committer l'ISA.

**Preuve** :
- Job 139600317749 : étape 13 « Exécuter opencode » success
  00:15:15→00:31:59 ; étape 16 « Statut final » failure
  `run opencode non terminé : erreur` ; aucune annotation d'erreur opencode
  (sa sortie n'était pas journalisée).
- `ISATool.ts:1` = `#!/usr/bin/env bun` ; `ISATool.ts:12-13` écrit sous
  `$HOME/.claude/LIFEOS/MEMORY/STATE`.
- `env -i PATH=/usr/local/bin:/usr/bin:/bin sh -c 'command -v bun'` →
  introuvable ; `lifeos/LIFEOS/TOOLS/ISATool.ts` est en `-r--r--r--`.

**Correctif (5f42b95)** :
- Installation de bun (`BUN_VERSION`) puis copie dans `/usr/local/bin` pour les
  agents FullRun, visible sous `env -i`.
- Copie inscriptible du socle `lifeos/LIFEOS` + `lifeos/hooks` vers `~/.claude`,
  création de `MEMORY/STATE`, lien `/home/box` (agents FullRun).
- Bascule bornée (une seule) vers le modèle suivant sur erreur opencode, avec le
  temps restant.
- Publication des 200 dernières lignes masquées d'opencode dans le log quand
  `OC_STATUS=erreur` (`_agent-run.yml`, étape « Statut opencode »).

## Job `next` — HTTP 422 « Unexpected inputs provided: ["model"] »

**Cause** : `_next.yml` appelle `gh workflow run` sans `--ref` ; l'API valide les
entrées contre la branche par défaut (main), où les workflows `fr-*.yml` ne
déclarent pas encore l'entrée `model`. Passer `-f model` provoque donc un 422.

**Correctif** : `_next.yml` lit le workflow cible sur la branche de dispatch et
n'ajoute `-f model` que si `on.workflow_dispatch.inputs.model` existe. Même garde
appliquée à la relance `fr-fullrun.yml` (job `loop`).

## Vérifications

- `yaml.safe_load` sur tous les `.github/workflows/*.yml` : OK.
- `bash -n` sur les scripts `run` extraits de `_next.yml` et `fr-fullrun.yml` :
  OK.
- Détection testée : main `fr-plan-serena`/`fr-fullrun` → « NO model » ;
  branche → « declares model ».
