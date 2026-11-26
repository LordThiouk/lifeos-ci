# Driver F6 — ISC-F5-12 CTA unique par état (Papa 2026-11-26)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/ISA.md (leg F6).

Fais UNIQUEMENT ISC-F5-12 : une seule action principale actionnable par état —
- escale(s) pending → « Confirmer l'arrêt » visible+actif ; « Terminer la course » **masqué** (pas seulement disabled) ;
- dernier arrêt → « Confirmer l'arrêt » disparaît ; « Terminer la course » visible+actif avec style distinct (pas seulement opacité 0.6).
Fichier cible typique : ride_details_bottom_sheet_widget.dart (+ rounded_button si besoin). Preuve : flutter test test/unit/multistop_end_gate_test.dart (+ widget si déjà prévu Serena). Coche ISC-F5-12 via ISATool.ts avec preuve.

Règles Papa : pas de régression UI hors périmètre ; **ne régénère aucun golden** sans OK Papa (image+diff d'abord). Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
