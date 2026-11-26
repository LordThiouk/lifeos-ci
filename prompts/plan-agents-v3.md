# Plan v3: mini-workflows per step and per agent (short run, commit after each section)

Forbidden: `git push`, `gh`, creating workflows. Only edit `PLAN-AGENTS.md`. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

**Goal (Papa):** the FullRun must go through correctly despite how fragile the free models are (timeouts, 0 commits, losing the thread).
So: one **mini-workflow per step and per agent**, each short (10–15 min), committing right away, chained by the FullRun, which **restarts from the step that failed** instead of starting over.

**Papa's decisions (2026-11-25):**
1. Add to `_agent-run.yml` the inputs `stop_after_step`, `target_agent` and `chain_phase`.
2. Parallel builds: **one branch per agent**, merged into the FullRun branch.
3. Workflows outside the FullRun (Artist, researchers, Arthur, Cato): later. FullRun first.

Update `PLAN-AGENTS.md` (at most 90 lines):
- write these decisions in, and remove the open questions they answer;
- a table of mini-workflows: step × agent, workflow name, timeout, what it commits, and how it resumes on failure;
- resuming: how the FullRun detects the failed step (state/artifact) and restarts it only, and whether it switches to the next free model after a timeout;
- the order of creation (smallest first, one task per workflow, the independent ones in parallel).

**Commit after each section.**
