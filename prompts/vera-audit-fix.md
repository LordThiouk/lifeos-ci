# Corriger l'échec opencode « erreur » de fr-plan-vera (2026-11-26 00:35 Dakar)

Runs lifeos-ci 45727313456 (16 min puis OC_STATUS erreur, aucun commit) et 45729541863 (model=opencode/mimo-v2.6-flash-free, erreur en moins d'une minute). Job lot-client-vera-audit sur Galass_backend fullrun/lot-client-w0. Les logs ne montrent pas la sortie d'opencode.
1. Lis les logs et artefacts de ces deux runs (gh run view --log, gh run download) et trouve la cause exacte (option non reconnue comme pour serena / FIX-SERENA.md, modèle refusé, prompt, ISA introuvable…).
2. Corrige le workflow sur cette branche (fix/extra-repos-full) ; fais aussi afficher la fin de la sortie opencode dans le log quand OC_STATUS=erreur.
3. Écris FIX-VERA-AUDIT.md : cause avec preuve (ligne de log), correctif.
Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas main.

## Reprise (2026-11-26 01:36 Dakar)
Le run précédent s'est arrêté sur quota après le commit wip 5f42b95 (_agent-run.yml : BUN_VERSION, nom court du modèle, SIGPIPE grep -q). Reprends à partir de là : vérifie ce commit, termine la correction, et corrige aussi le job `next` (enchaînement, utilisé seulement pour l'assemblage FullRun complet ; les mini workflows restent à leur étape) qui plante en HTTP 422 « Unexpected inputs provided: ["model"] » : ne transmettre `model` qu'aux workflows qui le déclarent. Petits commits, pas de git push.
