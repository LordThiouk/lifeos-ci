# Rider — ISC-F4-23 destination finale réelle après dernier arrêt (Papa 2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-rider-multistop/ISA.md.

Fais UNIQUEMENT ISC-F4-23 : après le dernier arrêt, le Rider affiche la vraie destination finale (adresse lisible en entier), jamais un libellé générique type « En route vers Point E » / placeholder. Preuve : flutter test widget/unit ciblé + coche ISATool.ts.

**GOLDEN** : ne régénère aucun golden sans OK Papa. Pas de flutter build. Pas de git push. Ne touche pas .fullrun. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>.
