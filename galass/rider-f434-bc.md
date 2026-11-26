# Rider F4-34 — options C + B (2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15, tête 963fa82 (F4-32 a1–a5 faits). ISA : MEMORY/WORK/20261006-galass-rider-multistop/.
Décision Papa 2026-11-26 : **les deux** —
- **C** : au Pusher `pick_up`, alerte client unique (audio + vibre + notif), helper one-shot clé `ride_id`+type `pick_up` (2e no-op ; nouvelle course ré-alerte).
- **B** : sur `live_location` / position chauffeur, geofence « **arrive bientôt** » (alerte distincte, type `arriving_soon`), one-shot par `ride_id` ; ne remplace pas C. Dépend de la position F4-32 déjà branchée.
Dédup FCM par `ride_id`+type dans `push_notification_service` (pas deux show pour le même type). Pas d’événement backend `driver_arrived` (hors C/B).
Preuve : `flutter test test/unit/multistop_pusher_test.dart` (séquences B puis C = 2 alertes de types différents ; 2e même type = no-op ; nouveau ride = reset) + `flutter analyze` fichiers touchés. **Pas de régression UI** ; golden : lancer existants, **ne pas régénérer** sans OK Papa + image/diff. Coche ISC-F4-34 via ISATool seulement si preuves vertes ; consigne la décision B+C dans l’ISA (Decisions).
Rôle Engineer. Un ou plusieurs petits commits. Galass_backend lecture seule (sauf si lecture ancres). Pas de revue. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun. Ne lis pas evidence/, kuna_*.c, match_*.md.
