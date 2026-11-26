# Galass — retrouver l'ISA des bugs et sa branche (Papa 2026-11-25 22:00 Dakar)

Lecture seule. Cherche dans TOUS les dépôts Galass de LordThiouk (Galass_Rider, Galass_Driver, Galass_backend, galass-ci, galass-emu-actions-pub et tout autre dépôt dont le nom contient galass), sur TOUTES les branches (gh api, git ls-remote, git log --all), l'ISA qui porte sur la correction des bugs Galass (hors multistop). Indices : ISA dans MEMORY/WORK/ ou .claude/PAI/MEMORY/WORK/ dont le titre, le slug ou le contenu parle de bugs / BUGS.md / triage / corrections ; branches fix/*, bugs*, docs/bugs-triage-2026-11-22.

Livre docs/galass-bugs-isa-locate-2026-11-25.md : pour chaque candidat, dépôt, branche, chemin exact de l'ISA, date du dernier commit, phase/progress, nombre d'ISC ouverts/cochés, et si Vera y est déjà passée. Termine par UN verdict : l'ISA et la branche à utiliser pour lancer Vera.

Ne modifie rien d'autre. Commit unique, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push.
