# Driver F6 — ISC-F5-13 Annuler = danger distinct (Papa 2026-11-26)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/ISA.md (leg F6).

Fais UNIQUEMENT ISC-F5-13 : « Annuler la course » reste visuellement distinct (couleur danger) du CTA principal, quel que soit l'état. Verrou de régression (déjà vrai en code — ne casse pas). Preuve : flutter test test/unit/multistop_end_gate_test.dart. Coche ISC-F5-13 via ISATool.ts avec preuve.

Règles Papa : **ne régénère aucun golden** sans OK Papa. Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
