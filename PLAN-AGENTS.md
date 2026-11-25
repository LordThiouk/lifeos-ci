# Plan — un workflow par agent LifeOS (FullRun)

Vérifié sur le clone lifeos (lecture seule, `main`) : `skills/FullRunWorkflow/SKILL.md`,
`LIFEOS/TOOLS/FullRunPipeline.ts` (`FULLRUN_STEPS`, `AGENT_ALIASES`, `VERIFY_AGENT_ORDER`, `buildStepGuidance`), `FullRunAgentNames.test.ts`. opencode charge `agents/*.md` et `opencode/agent/*.md`. Auteur : Papa Diop.

## Agents réels (étapes FullRun)

| Agent (fichier lifeos) | Rôle | Étape(s) | Chemin source |
| --- | --- | --- | --- |
| Nix/LifeOS | Orchestrateur, seul écrivain de l'ISA | 0, 1, 7, 8 | `opencode/nix-lifeos.prompt.md` ; enregistré dans `opencode/config/opencode.json` (lifeos-ci) |
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

Un agent par job (`unit --stop-after-step <step> --agent <nom>`). Ordre verify imposé par la porte :
`code-reviewer`, `forge`, `silas`, chacun dans son propre job. Échec verify → build (4), jamais `vera`/`serena`, sauf critères ISC changés (→ 2).

## Décisions Papa (2026-11-25)

1. `_agent-run.yml` expose `stop_after_step`, `target_agent` et `chain_phase` (inputs à ajouter).
2. Build parallèle : **une branche par agent**, fusionnée dans la branche du FullRun.
3. Hors FullRun (Artist, chercheurs, Arthur, Cato) : plus tard. **FullRun d'abord.**

But : un mini-workflow court par étape et par agent, qui committe tout de suite ; le FullRun
enchaîne et **repart de l'étape échouée** au lieu de tout recommencer.
