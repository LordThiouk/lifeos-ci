# Review briques FullRun — lot b

Verdict : **MERGE OK**

| Brique | YAML | inputs wd/call | agent / target | step / phase | next (chain && ok) | secrets/push | inputs _agent-run |
|---|---|---|---|---|---|---|---|
| build-anvil | OK | identiques + chain | anvil / Anvil | 4 / build | OK | aucun | tous présents |
| build-forge-code | OK | identiques + chain | forge-code / Forge | 4 / build | OK | aucun | tous présents |
| verify-code-review | OK | identiques + chain | code-review / code-reviewer | 5 / verify | OK | aucun | tous présents |

## Problèmes
- Aucun bloquant.
- Mineur (non bloquant) : `.github/workflows/fr-build-forge-code.yml:60` — input `chain` (workflow_dispatch) sans `description`, contrairement aux autres briques.
