# One task only: create `.github/workflows/fr-fullrun.yml` (the FullRun assembly). Commit RIGHT AWAY.

Forbidden: push, `gh`, editing any other file. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
Read `PLAN-AGENTS.md` (`git show origin/plan/agents-2026-11-25:PLAN-AGENTS.md`) and `.github/workflows/fr-plan-vera.yml` (input template).

The assembly calls ONLY the bricks, through `uses: ./.github/workflows/fr-<x>.yml` with `chain: false` and `secrets: inherit` (each brick has a `workflow_call` trigger with the same inputs as fr-plan-vera plus `chain`). Bricks: fr-plan-vera, fr-plan-serena, fr-build-aditi-ui, fr-build-engineer, fr-build-anvil, fr-build-forge-code, fr-verify-code-review, fr-verify-forge-audit, fr-verify-silas, fr-close-max.

1. Inputs: those of fr-plan-vera plus `start_phase` (plan|build|verify|close, default plan), `only` (brick name, empty = all), `attempt` (default "1"), `max_attempts` (default "3").
2. Jobs, with `needs:` and an `if:` that respects start_phase/only: vera → serena → the 4 builds in parallel → code-review → forge-audit → silas → max. Each job runs only if the previous ones succeeded or were skipped by start_phase.
3. A final job `loop`: if a verify job or max failed and `attempt < max_attempts`, re-launch this same workflow with `start_phase=build` and `attempt+1` (`gh workflow run fr-fullrun.yml` with `GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}`, `permissions: actions: write`). Otherwise stop.
4. Empty inputs = the whole FullRun from start to finish with no stop.
5. Check the YAML with `python3 -c "import yaml;yaml.safe_load(open('.github/workflows/fr-fullrun.yml'))"`, then commit with the message "feat(fr): assemblage fr-fullrun". Stop.
