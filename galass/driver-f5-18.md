# Driver — ISC-F5-18 goldens stop1/stop2 actifs distincts (Papa 2026-11-26)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/ISA.md.

Fais UNIQUEMENT ISC-F5-18 : les deux références RUNNING « arrêt 1 actif » et « arrêt 2 actif » doivent être distinctes (sha256 différents) et rendre visiblement completedAt/progression. Aujourd'hui mesurés identiques — corrige le rendu (timeline/CTA) pour falsifier. Preuve : sha256sum des PNG + golden widget. Coche ISC-F5-18 via ISATool.ts seulement si sha256(a)≠sha256(b).

**GOLDEN** : ne régénère / n'écrase aucun golden sans OK Papa explicite + image+diff. Sans OK : code+test rouge qui prouve l'écart, pas de write PNG. Pas de flutter build. Pas de git push. Ne touche pas .fullrun.
