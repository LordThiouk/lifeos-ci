# Proposition — porte push malgré gel opencode (Papa 12:05)

**Fichier :** `.github/workflows/_agent-run.yml`  
**Statut :** proposition seulement — **ne pas merger sans OK Papa**.

## Cause racine (preuve livelog)

1. L’agent **ne pousse jamais** (préambule `ci-preamble.md` : « Tu ne pousses rien »).
2. L’étape **« Porte gitleaks, garde-fou, push fast-forward… »** a déjà `if: always()` — elle s’exécute **dès que** l’étape « Exécuter opencode » se termine (ok/timeout/erreur), **pas** à la rédaction de `/tmp/task_done.md`.
3. Gel observé (runs `46131105603`, `46137897145`, `46141301050`) : après `task_done` + commits locaux, l’agent **relit le prompt / dump ISATool.ts** et **ne quitte pas** → `timeout ${IN_TIMEOUT_MIN*60} opencode run` reste bloqué jusqu’au plafond (souvent 90 min) → la porte push n’est pas atteinte tant que le process vit.
4. Un **cancel** GitHub tue le job **avant** la porte → commits locaux **perdus** (SHA absents du remote ; corps des `Write` absents du livelog).

### Extrait gel F4-29 (`46141301050`)

Dernières lignes utiles (~11:55 UTC) : commits `b8703db` + `a9fbc7d`, `WORKTREE CLEAN`, `← Write /tmp/task_done.md`, rapport FORGE COMPLETED.  
Puis : `→ Read …/prompt.md` + relecture / dumps — **début de la boucle**.

## Correctif proposé

Dans l’étape « Exécuter opencode », wrapper `opencode run` avec un **idle-watchdog** (démon root, hors portée agent) :

1. Surveiller : mtime de `$log` **et** `git -C target rev-parse HEAD` (nouveau commit).
2. **Armer** le watchdog seulement si **les deux** sont vrais :
   - `test -f /tmp/task_done.md`
   - `rev-list --count $base..HEAD >= 1`
3. Si **aucune** nouvelle sortie log **et** aucun nouveau commit pendant **N=10 min** (configurable) → `pkill -KILL` le process `opencode run` du job.
4. Le `timeout` global reste le filet (90 min).
5. Après kill : status = `timeout` (ou nouveau `idle`) → étapes `if: always()` (statut + **porte push**) s’exécutent → push des commits déjà sur le disque du runner.

### Limite anti « commit à moitié »

Ne tuer sur idle **que si** :

- `/tmp/task_done.md` existe **et** contient une ligne `COMPLETED` / `VERDICT` / `commits` (heuristique), **ou**
- le dernier commit message matche `^(test|feat|fix|docs)\(` **et** (option) un fichier preuve listé dans le prompt a été touché ;

Sinon : ne pas idle-kill (laisser le timeout global).  
Ne **jamais** `git add`/`commit` depuis le workflow pour « sauver » un worktree dirty — seulement pousser des commits déjà créés par l’agent (comportement actuel de la porte, lignes `count -eq 0` → skip).

### Risques

| Risque | Mitigation |
|---|---|
| Kill trop tôt pendant un `flutter test` long silencieux | N=10 min + armement seulement post-`task_done` |
| Push d’un commit de code sans tick ISA | Jobs minuscules 1 ISC ; ou exiger 2 commits (code+docs) si le prompt le demande |
| Faux `timeout` OC_STATUS | Nouveau status `idle` distinct, traité comme ok-pour-push si `count>0` |

## Hors scope

Pas de merge `main`. Pas Artemis. Pas changement des seuils P0.
