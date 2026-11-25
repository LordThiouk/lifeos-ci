# Plan — un workflow par agent LifeOS (FullRun)

Vérifié sur le clone lifeos (lecture seule, `main`) : `skills/FullRunWorkflow/SKILL.md`,
`LIFEOS/TOOLS/FullRunPipeline.ts` (`FULLRUN_STEPS`, `AGENT_ALIASES`, `VERIFY_AGENT_ORDER`,
`buildStepGuidance`), `FullRunAgentNames.test.ts` (fichier par agent d'étape, sauf `bugbot`).
opencode charge `agents/*.md` et `opencode/agent/*.md`. Auteur : Papa Diop.

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

Un agent par job (`unit --stop-after-step <step> --agent <nom>`). Ordre verify imposé par la
porte : `code-reviewer`, `forge`, `silas` (`VERIFY_AGENT_ORDER`), chacun dans son propre job.
Échec verify → retour au build (4), jamais à `vera`/`serena`, sauf critères ISC changés (→ 2).

## Workflows à créer

Wrapper `fr-<phase>-<agent>.yml` par agent, sans duplication : `uses: ./.github/workflows/_agent-run.yml`
(`agent`, `phase`, `step`, `target_agent`), puis `_next.yml`.

| Workflow | Agent → canonique | Étape |
| --- | --- | --- |
| `fr-plan-vera.yml` | `vera` → **Algorithm** | 2 |
| `fr-plan-serena.yml` | `serena` → **Architect** | 3 |
| `fr-build-aditi-ui.yml` | `aditi-ui` → **Designer** | 4 UI |
| `fr-build-engineer.yml` | `engineer` → **Engineer** | 4 code |
| `fr-build-anvil.yml` | `anvil` → **Anvil** | 4 code |
| `fr-build-forge-code.yml` | `forge-code` → **Forge** BUILD | 4 code |
| `fr-verify-code-review.yml` | `code-review` → **code-reviewer** | 5 |
| `fr-verify-forge-audit.yml` | `forge-audit` → **Forge** AUDIT | 5 |
| `fr-verify-silas.yml` | `silas` → **Silas** | 5 |
| `fr-close-max.yml` | `max` → **Max** | 6 |

## Vagues

- Vague 0 : `vera` (Algorithm). Vague 1 : `serena` (Architect), dépend de Vera.
- Vague 2 (build, parallèle si scopes `[scope:…]` disjoints et branches séparées) :
  `aditi-ui`, `engineer`, `anvil`, `forge-code` — un job par agent, aucun ordre entre eux.
- Vague 3 (verify) : **séquentielle** — `code-reviewer` → `forge-audit` → `silas` ; un job qui
  saute un prédécesseur sans PASS frais échoue. `bugbot` optionnel en sus. (Le skill dit
  « any order » ; le code impose l'ordre.)
- Vague 4 : `max` (6), puis `close` (7) par Nix après le PASS de Max.
- `Nix/LifeOS` orchestre (0, 1, 7, 8) et ne se lance pas dans les vagues.

## Questions tranchées par lifeos

- **Vera/Serena : agent ou phase ?** Les deux : `vera`/`serena` sont les clés des étapes 2/3 ;
  les agents sont **Algorithm**/**Architect**, alias `Vera`/`Serena` (`AGENT_ALIASES` + fichiers
  générés `opencode/agent/Vera.md`, `Serena.md`).
- **`close` : son propre agent ou dans Max ?** Ni l'un ni l'autre : étape 7 `nixOnly`,
  `agents: []` — Nix exécute `CheckCompleteness` puis `phase: complete` après le PASS de Max (6).
- **`bugbot`** : audit optionnel, « jamais bloquant pour l'étape » (`FullRunPipeline.ts`).
- **Hors FullRun** : `Cato` aliasé → Forge ; `BrowserAgent`/`QATester`/`UIReviewer` DEPRECATED
  (skill Interceptor) ; chercheurs = étape `research` (-1) ; `Artist` = skill Media ;
  `Arthur` = narrateur de crédentiels, ne décide jamais d'une release.

## Questions ouvertes (non tranchées par lifeos)

- `_agent-run.yml` n'expose pas `stop_after_step`/`target_agent`/`chain_phase` : inputs à ajouter.
- Parallélisme build : lifeos ne fixe pas la stratégie branches/PR (branches séparées nécessaires).
- Périmètre CI hors FullRun : créer des workflows pour Artist, chercheurs, Arthur, Cato ?
