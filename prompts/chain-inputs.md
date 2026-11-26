# lifeos-ci — chain propagé, mini workflow (Papa 2026-11-26 03:44 Dakar)

Branche fix/extra-repos-full (tête 77e8e9b). Problème : 10 workflows d'étape passent `chain: true` en dur au job next (fr-plan-vera, fr-plan-serena, fr-build-anvil, fr-build-aditi-ui, fr-build-forge-code, fr-build-engineer, fr-verify-forge-audit, fr-verify-code-review, fr-verify-silas, fr-close-max), donc le passage auto repart.
Tâche : remplace chacun par `chain: ${{ inputs.chain }}` (garde le type booléen). Vérifie : `rg -n "chain: true" .github/workflows` ne renvoie plus rien dans ces 10 fichiers ; yaml.safe_load des workflows OK. Note le correctif en 1 ligne dans FIX-VERA-AUDIT.md.
Petits commits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Rien d'autre.
