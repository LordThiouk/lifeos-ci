# Antenly FR-04 — merge Vague 4 L7+L9 into isa (2026-11-26)

Dépôt antenly, branche **isa/fr-04-vera-2026-11-26** (déjà à `885009e` = Max V3 + merge L6).

Fais UNIQUEMENT : fusionner `build/fr04-l7` (`6002480` T7.1) puis `build/fr04-l9` (`2c73957` T9.1) dans `isa/fr-04-vera-2026-11-26` avec merges `--no-ff` messages `merge(fr04): Vague 4 L7 into isa` et `merge(fr04): Vague 4 L9 into isa`. Résous le conflit attendu dans `api/src/antenly_api/eval/segmentation.py` (L6 a touché le même fichier) en **conservant les deux comportements** (P95 frontières L6 + par classe/station L7). Vérifie :
`uv run --project api pytest api/tests/segmentation/test_boundary_p95.py api/tests/segmentation/test_per_station.py api/tests/segmentation/test_threshold_state.py -q`
et ruff sur fichiers touchés. Pas de nouvelle feature. Ne commence pas Verify. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`.
