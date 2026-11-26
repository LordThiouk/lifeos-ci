# Rider F4-34 — rebuild après Verify×3 BLOCK (Papa 2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-rider-multistop/. Décision Papa F4-34 = C+B.

VERIFY-F434.md (forge/cr/silas) = VERDICT BLOCK. Corrige UNIQUEMENT les points code bloquants :
1. Porte one-shot liée au `ride_id` (pas au cycle de vie de l'écran) — survivre à reset/recréation `PusherRideController` / `RideDetailsScreen`.
2. Dédup cross-canal Pusher ↔ FCM partagée pour le même couple `ride_id`+type (pas deux instances disjointes).
3. iOS : la dédup doit aussi couvrir le chemin notification foreground (pas seulement data-only / show local).
4. Tests unit : recréation contrôleur, dédup FCM, cross-canal ; `flutter test` + analyze sur fichiers touchés.
Coche/preuve ISA via ISATool si code+unit OK. **Ne régénère aucun golden.** Device/Artemis hors ce leg (gate Papa). Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
