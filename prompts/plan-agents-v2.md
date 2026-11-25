# Confirm the per-agent plan from the real lifeos repo (short run)

Forbidden: `git push`, `gh`, changing workflows. Only edit `PLAN-AGENTS.md` at the root.
`PLAN-AGENTS.md` is a draft written WITHOUT access to lifeos (paths rebuilt from step-agents.sh and _next.yml). This run has read access to lifeos (extra_repos).

1. Find the lifeos clone: `fd -t d -d 3 '^lifeos$' / 2>/dev/null | head` (or `$LIFEOS_DIR`).
2. In lifeos, list only: `fd -t f . <lifeos> | rg -i '(agents?|skills?)/' | rg -i 'fullrun|agent' | head -80`. Read the FullRun skill (its SKILL.md) and the header of each agent file (20 lines at most each).
3. Fix `PLAN-AGENTS.md`:
   - the real agent list and their real paths;
   - the real steps of the FullRun skill, and which agent handles which step;
   - answer the open questions from what lifeos says (Vera and Serena: agent or phase? agent-close: on its own or inside Max?);
   - keep only the questions that lifeos does not settle.

At most 80 lines. **Commit after each section.** Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
