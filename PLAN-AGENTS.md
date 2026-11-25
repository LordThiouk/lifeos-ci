# Plan — un workflow par agent LifeOS (FullRun)

Source vérifiée : clone `LordThiouk/lifeos` (lecture seule, `main`) — `skills/FullRunWorkflow/SKILL.md`
et `LIFEOS/TOOLS/FullRunPipeline.ts` (`FULLRUN_STEPS`). opencode charge `agents/*.md` et
`opencode/agent/*.md` ; `FullRunAgentNames.test.ts` exige un fichier par agent d'étape. Auteur : Papa Diop.

## Agents réels

| Agent (fichier) | Rôle | Étape(s) | Chemin source |
| --- | --- | --- | --- |
| Nix/LifeOS | Orchestrateur, seul écrivain de l'ISA | 0, 1, 7 | `opencode/nix-lifeos.prompt.md` + `opencode/config/opencode.json` |
| Algorithm (Vera Sterling) | Audit structure ISA | 2 `vera` | `agents/Algorithm.md` (alias `opencode/agent/Vera.md`) |
| Architect (Serena Blackwood) | Plan + dispatch map `ui\|code` | 3 `serena` | `agents/Architect.md` (alias `opencode/agent/Serena.md`) |
| Designer (Aditi Sharma) | Build UI | 4 `build` UI | `agents/Designer.md` |
| Engineer (Marcus Webb) | Build logique, TDD | 4 `build` code | `agents/Engineer.md` |
| Forge | Build OpenAI + audit croisé | 4 `build`, 5 `verify` | `agents/Forge.md` |
| Anvil | Build long contexte (Kimi) | 4 `build` code | `agents/Anvil.md` |
| code-reviewer | Revue de code | 5 `verify` | `opencode/agent/code-reviewer.md` |
| Silas (Silas Locke) | Sécurité offensive | 5 `verify` | `agents/Silas.md` |
| Max | Porte finale, lecture seule | 6 `max` | `agents/Max.md` |
| bugbot | Relecteur externe, sans fichier opencode | 5 `verify` | externe |

## Étapes réelles du skill FullRun (0–7)

| # | Clé | Agent / acteur | Gate |
| --- | --- | --- | --- |
| 0 | `scaffold` | Nix | `ISA.md` existe |
| 1 | `completeness_pre` | Nix, `CheckCompleteness` | `status: pass` |
| 2 | `vera` | **Algorithm** (Vera) | sections, ISC orphelins, Anti, Test Strategy |
| 3 | `serena` | **Architect** (Serena) | dispatch + verdict, Plan/`ui\|code` après dispatch |
| 4 | `build` | **Designer** (UI) / **Engineer**, **Forge**, **Anvil** (code) | claims `[x]` avec preuve outil |
| 5 | `verify` | **code-reviewer**, **Silas**, **Forge** audit, **bugbot** | PASS frais par agent |
| 6 | `max` | **Max** | PASS strict JSON |
| 7 | `close` | Nix, `CheckCompleteness` + `phase: complete` | completeness pass (Max valide en CI) |

Un agent par job (`--stop-after-step <step> --agent <nom>`). Un échec verify redescend au
build (4), jamais à `vera`/`serena`, sauf si les critères changent.

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
