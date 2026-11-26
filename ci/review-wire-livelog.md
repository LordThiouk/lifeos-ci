# lifeos-ci — revue PR livelog `_agent-run` (Papa 2026-11-26)

Dépôt **lifeos-ci**, branche **cursor/wire-livelog-e410** (PR #23 → `fix/extra-repos-full`).

Périmètre revue : commits livelog uniquement :
- `1277a5c` — `ci(agent-run): brancher le journal en direct sur le dépôt cible`
- `1162e1c` — `test(ci): vérifier le branchement livelog de _agent-run`

Critères PASS :
1. Étape « Journal en direct » dans `.github/workflows/_agent-run.yml` **avant** « Exécuter opencode », `continue-on-error: true`, démon `livelog.sh` via `setsid`.
2. Cible = `TARGET_REPO` du run (**pas** antenly en dur).
3. Outils `livelog.sh` (+ leaklog/redact/allowed-repos) figés dans `/opt/fullrun-tools`.
4. Test `opencode/tests/agent-run-livelog-test.sh` vert via `opencode/tests/run-all.sh` (ou le test seul).
5. Pas de secrets PSP / tokens en clair dans le diff.

Écris `REVIEW-WIRE-LIVELOG.md` à la racine : 1re ligne `VERDICT: PASS` ou `VERDICT: BLOCK`, points, sortie tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`. Ne change pas le code sauf si BLOCK trivial de test manquant — préférer BLOCK.
