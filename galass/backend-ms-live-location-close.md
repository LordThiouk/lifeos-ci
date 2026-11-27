# Backend multistop — fermer F13 T1 live_location + preuves Pusher (2026-11-27)

Dépôt Galass_backend, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-regression-multistop/.

Contexte : `DriverController::locationUpdate` émet déjà `EventsRide("rider-user-$id", 'LIVE_LOCATION', …)` si course ACTIVE/RUNNING. Rider ISC-F4-32 écoute `live_location`.

Fais UNIQUEMENT :
1. Vérifie/alignement event name + payload (lat/lng) pour que Rider consomme sans ambiguïté (casse/canal).
2. PHPUnit Feature : ping location pendant ACTIVE/RUNNING → event LIVE_LOCATION sur canal rider-user ; hors course → pas d’event.
3. Si preuves VERT : coche les ISC liés (émission live_location / F13 T1 / preuves staging si déjà en table) via ISATool ; sinon laisse ouvert avec falsifier.
4. Touche aussi ISC-39.x seulement si tests STOP_COMPLETED déjà verts et tu peux les prouver sans device.
Pas de deploy. Pas de secrets. Un dépôt. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de push. Pas .fullrun.
