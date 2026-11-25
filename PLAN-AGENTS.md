# Plan — un workflow par agent LifeOS (FullRun)

Source vérifiée sur le clone lifeos (lecture seule, `main`) : `skills/FullRunWorkflow/SKILL.md`,
`LIFEOS/TOOLS/FullRunPipeline.ts` (`FULLRUN_STEPS`, `AGENT_ALIASES`, `VERIFY_AGENT_ORDER`,
`buildStepGuidance`) et `FullRunAgentNames.test.ts`. opencode charge `agents/*.md` et
`opencode/agent/*.md` ; le test exige un fichier par agent d'étape (sauf `bugbot`). Auteur : Papa Diop.

## Agents réels (étapes FullRun)

| Agent (fichier lifeos) | Rôle | Étape(s) | Chemin source |
| --- | --- | --- | --- |
| Nix/LifeOS | Orchestrateur, seul écrivain de l'ISA | 0, 1, 7, 8 | `opencode/nix-lifeos.prompt.md` (lifeos) ; enregistré dans `opencode/config/opencode.json` (lifeos-ci) |
| Algorithm (Vera Sterling) | Audit structure ISA | 2 `vera` | `agents/Algorithm.md` (alias `opencode/agent/Vera.md`) |
| Architect (Serena Blackwood) | Plan + dispatch map `ui\|code` | 3 `serena` | `agents/Architect.md` (alias `opencode/agent/Serena.md`) |
| Designer (Aditi Sharma) | Build UI | 4 `build` UI | `agents/Designer.md` |
| Engineer (Marcus Webb) | Build logique, TDD | 4 `build` code | `agents/Engineer.md` |
| Forge | Build OpenAI + audit croisé | 4 `build`, 5 `verify` | `agents/Forge.md` |
| Anvil | Build long contexte (Kimi K2.6) | 4 `build` code | `agents/Anvil.md` |
| code-reviewer | Revue de code (1er du verify) | 5 `verify` | `opencode/agent/code-reviewer.md` |
| Silas (Silas Locke) | Sécurité, rôle Security obligatoire | 5 `verify` | `agents/Silas.md` |
| Max | Porte finale, lecture seule | 6 `max` | `agents/Max.md` |
| bugbot | Relecteur externe, sans fichier opencode | 5 `verify` (optionnel) | externe |

## Étapes réelles du skill FullRun (0–7, + deploy)

| # | Clé | Agent / acteur | Gate (`buildStepGuidance`) |
| --- | --- | --- | --- |
| 0 | `scaffold` | Nix seul (`nixOnly`) | `ISA.md` existe |
| 1 | `completeness_pre` | Nix, `CheckCompleteness` (`skillOnly`) | exit 0 |
| 2 | `vera` | **Algorithm** (Vera) | `ISAGate.ts --json` → `blocks: false` |
| 3 | `serena` | **Architect** (Serena) | dispatch + verdict Serena, Plan/`ui\|code` après dispatch |
| 4 | `build` | **Designer** (UI) / **Engineer**, **Forge**, **Anvil** (code) | `IsaFrontier.ts validate` + claims du scope `[x]` |
| 5 | `verify` | **code-reviewer** → **Forge** (audit) → **Silas** ; **bugbot** optionnel | PASS frais par agent (`OC_DONE_AGENTS`) |
| 6 | `max` | **Max** | JSON final `{"verdict":"pass"}` ou `VERDICT: PASS` |
| 7 | `close` | Nix seul (`nixOnly`), `CheckCompleteness` | exit 0, puis `phase: complete` |
| 8 | `deploy` | Nix seul, jamais une porte (`start_step` refuse) | drapeau posé explicitement par le principal |

Un agent par job (`unit --stop-after-step <step> --agent <nom>`). L'ordre du verify est imposé :
`code-reviewer`, `forge`, `silas` (`VERIFY_AGENT_ORDER`), chacun dans son propre job. Un échec
verify redescend au build (4), jamais à `vera`/`serena`, sauf critères ISC changés (→ 2).

## Workflows à créer

Un wrapper `fr-<phase>-<agent>.yml` par agent dispatchable, sans duplication :
`uses: ./.github/workflows/_agent-run.yml` (`agent`, `phase`, `step`, `target_agent`), puis `_next.yml`.

| Workflow | Agent → canonique | Étape |
| --- | --- | --- |
| `fr-plan-vera.yml` | `vera` → **Algorithm** | 2 |
| `fr-plan-serena.yml` | `serena` → **Architect** | 3 |
| `fr-build-aditi-ui.yml` | `aditi-ui` → **Designer** | 4 UI |
| `fr-build-engineer.yml` | `engineer` → **Engineer** | 4 code |
| `fr-build-anvil.yml` | `anvil` → **Anvil** | 4 code |
| `fr-build-forge-code.yml` | `forge-code` → **Forge** BUILD | 4 code |
| `fr-verify-code-review.yml` | `code-review` → **code-reviewer** | 5 |
| `fr-verify-silas.yml` | `silas` → **Silas** | 5 |
| `fr-verify-forge-audit.yml` | `forge-audit` → **Forge** AUDIT | 5 |
| `fr-close-max.yml` | `max` → **Max** | 6 |

`close` (7) n'est pas un agent : Nix exécute `CheckCompleteness` + `phase: complete` après
le PASS de Max. Pas d'`agent-close`, ni `agent-aditi`, ni doublon `agent-algorithm`/`agent-architect`
(Vera/Serena sont leurs alias).

## Vagues parallèles

- Vague 0 : `vera` (Algorithm).
- Vague 1 : `serena` (Architect), dépend de Vera.
- Vague 2 (build, parallèle si scopes `[scope:…]` disjoints et branches séparées) :
  `aditi-ui`, `engineer`, `anvil`, `forge-code` — un job par agent.
- Vague 3 (verify, parallèle) : `code-review`, `silas`, `forge-audit` (+ `bugbot`) — un verdict par agent.
- Vague 4 : `max` (6), puis `close` (7) par Nix après le PASS de Max.
- `Nix/LifeOS` orchestre (0, 1, 7) et ne se lance pas dans les vagues.

## Questions ouvertes (non tranchées par lifeos)

- `_agent-run.yml` n'expose pas `stop_after_step`/`target_agent`/`chain_phase` : inputs à ajouter.
- Parallélisme build : lifeos ne fixe pas la stratégie branches/PR (branches séparées nécessaires).
- Périmètre CI hors FullRun : workflows pour Artist, chercheurs, Arthur, Cato, dépréciés
  BrowserAgent/QATester/UIReviewer ? (`Cato` est déjà aliasé vers Forge dans FullRun.)
- `bugbot`, relecteur externe sans fichier opencode : intégration au verify à décider.
