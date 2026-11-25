# Allow acr-senegal as a READ-ONLY extra repo. Tiny task, commit right away.

Forbidden: push, `gh` write commands. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
1. In `targets/allowed-repos.sh`, allow `acr-senegal` ONLY as an extra repo (never as target_repo). If the file has a single list, add a separate extra-only list and make the validation use it for extra_repos only.
2. Make sure the guard never pushes to extra repos (it should already). Run `bash -n targets/allowed-repos.sh`.
3. Commit "ci: acr-senegal autorisé en lecture (extra seulement)". Stop.
