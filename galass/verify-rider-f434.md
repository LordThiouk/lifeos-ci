# Rider F4-34 — verify après build B+C (2026-11-26)

Dépôt Galass_Rider, ta branche verify/rider-f434-<toi> (copie feat/multistop-e2e-2026-11-15 @ e4d93c0 : code 61f2a29 + ISA B+C). ISA : MEMORY/WORK/20261006-galass-rider-multistop/.
Périmètre F4-34 uniquement : alerte C=`pick_up` + B=`arriving_soon` (geofence live_location), helper RideAlertOnce, dédup FCM ride_id+type. Lance vraiment `flutter test test/unit/multistop_pusher_test.dart` ; colle la sortie. Interdit de régénérer un golden. Preuve device : cite Artemis run si dispo ; si Artemis BLOCK (ex. golden Driver sans OK Papa), marque BLOCK sur la moitié device sans inventer de PASS.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien.
Écris VERIFY-F434.md à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sorties tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni .fullrun.
