# Driver F6 — ISC-F5-16 carte arrêt actif / estompés numérotés (Papa 2026-11-26)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/ISA.md (leg F6 ; plan Serena 2026-11-24).

Fais UNIQUEMENT ISC-F5-16 : carte course active — l'arrêt actif (prochain non-completed_at) a un style distinct ; les autres arrêts intermédiaires sont numérotés et estompés.
Respecte le contrat Serena : porteur stopMarkers / RideStopProgress ; **ne touche pas** intermediateStopLatLngs, currentLeg, polylineWaypointLatLngs, navigateCurrentLegOnly (non-régression ISC-F5-8). Preuve : flutter test test/unit/ride_map_multistop_test.dart (ou chemin ISA). Coche ISC-F5-16 via ISATool.ts avec preuve.

Règles Papa : **ne régénère aucun golden** sans OK Papa (image+diff d'abord). Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
