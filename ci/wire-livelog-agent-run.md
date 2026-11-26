# lifeos-ci — brancher livelog.sh sur _agent-run.yml (Papa 2026-11-26)

Dépôt lifeos-ci, branche **nouvelle** depuis `main` (ex. `fix/wire-livelog-2026-11-26`) — **jamais main directement**.

Constat : `opencode/livelog.sh` pousse `.fullrun/logs/<job>-<run>.log` sur `fullrun-logs/<job>-<run>` du dépôt **cible**. C’est branché dans `.github/workflows/opencode-fullrun.yml` (étape « Journal en direct ») mais **absent** de `.github/workflows/_agent-run.yml` → les runs `fr-*` / `task.yml` n’ont **aucun** livelog. Nix ne peut pas lire les logs détaillés des runs en cours.

Fais UNIQUEMENT : porter l’étape démon root livelog (même modèle que `opencode-fullrun.yml` ~1014–1050 : `LIVE_*`, `setsid` `$T/livelog.sh daemon`, jeton stdin, `continue-on-error: true`) dans `_agent-run.yml`, **avant** « Exécuter opencode », avec `TARGET_REPO` / remote = dépôt cible du run (pas hardcoder antenly). Copier aussi `livelog.sh` (+ deps `leaklog.sh`/`redact` si besoin) dans `/opt/fullrun-tools` comme le monolith si pas déjà figé. Test minimal si un test livelog existe. Un ou plusieurs petits commits. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push hors la branche. Ne touche pas .fullrun. Crée la PR brouillon via le workflow si le runner le fait, sinon laisse la branche.
