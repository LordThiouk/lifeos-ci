# lifeos-ci — corriger le plantage de Serena (Papa 2026-11-25 21:44 Dakar)

Branche fix/extra-repos-full. Constat : run 45696188565 (job rider-f428-sos, Galass_Rider), l'étape serena (fr-plan-serena.yml via _agent-run.yml) : « Exécuter opencode » finit en erreur en moins d'une seconde (20:43:26 → 20:43:27 UTC), juste après l'installation de ffmpeg, sans commit. Vera, juste avant dans le même run, a réussi. Pas un problème de quota.

1. Lis les logs : `gh run view 45696188565 -R LordThiouk/lifeos-ci --log` (job serena), et compare avec le job vera qui marche. Trouve la cause exacte (agent opencode serena absent/mal nommé, prompt vide, chemin ISA, variable manquante, modèle invalide…) avec preuve file:line.
2. Corrige la cause dans les workflows/config (fr-plan-serena.yml, _agent-run.yml, définition d'agent…). Corrige aussi : le timeout de l'étape GitHub doit dépasser le timeout opencode + les tentatives de secours (sinon le modèle de secours n'a pas de temps), et la relance « depuis build, tentative 2 » ne doit plus finir « success » en sautant toutes les étapes.
3. Ajoute un test ou un lint (actionlint/yaml) qui prouve la correction. Écris FIX-SERENA.md court : cause, correction, preuve.

Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push (refuse toute commande qui en contient). Ne touche pas main.
