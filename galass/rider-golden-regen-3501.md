# Rider — regen goldens sous Flutter 3.50.1 (Papa 2026-11-26)

Dépôt Galass_Rider, branche **feat/multistop-e2e-2026-11-15**.

Artemis `45778554984` ROUGE : goldens Rider `0.01%` (~164–174 px) sur `notation.png`, `rider_en_recherche.png`, `course_en_cours_simple.png` (+ éventuels autres) après alignement emu Flutter **3.50.1**. Même cause que Driver : baselines générées sous un autre SDK.

Fais UNIQUEMENT : régénérer les PNG goldens Rider avec **Flutter 3.50.1** (pas 3.35.6), commit `test(goldens): rebase rider sous Flutter 3.50.1 (regen Artemis)`, `flutter test test/goldens/rider` VERT. Ne change pas `lib/`. Ne touche pas Driver. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`.
