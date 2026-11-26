# Rider — ISC-F4-21 / F5-16 carte jambe active seulement (Papa 2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-rider-multistop/ISA.md.
Décision Papa déjà dans Decisions (commit 3798ba2) : sur la **carte Rider** multistop, mettre en avant **uniquement la jambe / l'arrêt actif** (comme Driver) — pas tous les arrêts.

Fais UNIQUEMENT le code+tests carte : alignement F4-21 ‖ F5-16 (porteur RideStopProgress / stopMarkers) pour que 1 arrêt actif soit distinct et les autres estompés/numérotés ; ne casse pas F4-10/F4-10.1 (shouldNumberStopMarkersForStatus reste PENDING-only). Preuve : flutter test test/unit/multistop_map_test.dart (+ helpers). Coche les ISC concernés via ISATool.ts avec preuve.

Règles Papa : pas de régression UI ; **ne régénère aucun golden** sans OK Papa (image+diff d'abord). Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
