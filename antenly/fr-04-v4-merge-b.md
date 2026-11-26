# Antenly FR-04 — merge Vague 4 L7+L9 (reprise FAIL)

Dépôt antenly, branche **isa/fr-04-vera-2026-11-26** @ `885009e` (Max V3 + L6). Task précédente `fr04-v4-merge` = failure.

Fais UNIQUEMENT : `git merge --no-ff origin/build/fr04-l7` puis `origin/build/fr04-l9` (SHAs `6002480` / `2c73957`). Résous `api/src/antenly_api/eval/segmentation.py` en **gardant L6 P95 + L7 par classe/station**. Messages : `merge(fr04): Vague 4 L7 into isa` / `merge(fr04): Vague 4 L9 into isa`.

Preuve :
`uv run --project api pytest api/tests/segmentation/test_boundary_p95.py api/tests/segmentation/test_per_station.py api/tests/segmentation/test_threshold_state.py -q`
+ ruff fichiers touchés. Pas de nouvelle feature. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`.
