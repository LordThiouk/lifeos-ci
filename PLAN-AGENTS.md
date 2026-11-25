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
