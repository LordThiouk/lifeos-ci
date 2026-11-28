# E2E staging report

Verdict: **FAIL**

P0: 10/30 PASS — non-PASS: driver-accepted-details, rider-driver-assigned, driver-pickup-arrived, rider-running-start, driver-running-stop1, rider-stop1-active, driver-stop1-done, rider-stop1-done, driver-stop2-done, rider-stop2-done, rider-destination-arrived, rider-cash-methods, rider-cash-waiting, rider-final-itinerary, driver-cash-request, driver-cash-confirmed, driver-summary, rider-rating, rider-home-after, backend-flow

| point | result | detail |
|---|---|---|
| api-preflight | PASS | staging /api/general-setting answered 200 |
| apk-base-url-rider | PASS | APK rider built with API_BASE_URL=staging |
| apk-base-url-driver | PASS | APK driver built with API_BASE_URL=staging |
| apk-base-url | PASS | Rider + Driver embed the staging base URL |
| apk-sha1 | PASS | rider=DD:1F:E6:C6:1A:2E:0D:50:93:B5:C9:05:31:57:B7:C8:B6:0C:CD:F7 driver=DD:1F:E6:C6:1A:2E:0D:50:93:B5:C9:05:31:57:B7:C8:B6:0C:CD:F7 |
| emulator-boot | PASS | 14 / API 34 |
| emulator-calm | PASS | aucun ANR pendant 60 s avant les tests |
| apk-install | PASS | Rider + Driver installed |
| driver-online-api | PASS | driver mis en ligne et confirmé par le backend |
| rider-home-loaded | PASS | ui cap=14-rider-home-loaded.png marker ok (grounded) |
| driver-home-online | PASS | ui cap=33-driver-home-online.png (replay=0) |
| llm-vision | SKIP | Artemis LLM désactivé (CLI opencode pilote l'émulateur) |
| artemis-smoke | SKIP | Artemis LLM désactivé — UI via taps + API (e2e/ui.sh) |
| artemis-rider-destination | SKIP | état produit par compose_ride_ui (taps UI) — plus d'appel Artemis |
| artemis-rider-stop1 | SKIP | état produit par compose_ride_ui (taps UI) — plus d'appel Artemis |
| artemis-rider-stop2 | SKIP | état produit par compose_ride_ui (taps UI) — plus d'appel Artemis |
| rider-destination-selected | PASS | ui cap=15-rider-destination-selected.png marker ok (grounded) |
| rider-stop-picker | PASS | ui cap=16-rider-stop-picker.png marker ok (grounded) |
| rider-multistop-summary | PASS | ui cap=17-rider-multistop-summary.png marker ok (grounded) |
| ride-composed | PASS | course composée dans l'app (adoptée par l'API) |
| ride-exists | PASS | ride_id=326 uid=XBTBHNZMDQ (rider 900106, 2 stops, cash) |
| driver-offer-with-stops | PASS | ui cap=34-driver-offer-with-stops.png marker ok (grounded, at-tap) |
| bug-b2-offer-stops | PASS | arrêts visibles dans l'offre (34) |
| driver-accepted-details | FAIL | no MATCH capture: 35-driver-accepted-details (TIMEOUT ; marqueur absent: +Point de prise en charge|+Arrêt 1|-Accepter\s+la\s+course ; fg=sn.galass.galassdriver (ui-dump)) |
| diag-driver-assign | FAIL | offer-expired (remark=offer_expired att=2 bal=3005.6 online=1) |
| rider-driver-assigned | FAIL | no MATCH capture: 19-rider-driver-assigned (TIMEOUT ; marqueur absent: +E2E Driver|+E2E-0001 ; fg=sn.galass.galassrider (ui-dump)) |
| bug-b7-push | WARN | unattributed: delta_pkg=1 mais 0 notification portant l'uid XBTBHNZMDQ |
| push-probe | WARN | delta sans uid => non attribuée (jamais PASS) |
| driver-pickup-arrived | FAIL | no MATCH capture: 36-driver-pickup-arrived (TIMEOUT ; marqueur absent: +Je suis arrivé|Prise en charge du client|-Accepter\s+la\s+course ; fg=sn.galass.galassdriver (ui-dump)) |
| rider-running-start | FAIL | no MATCH capture: 21-rider-running-start (TIMEOUT ; marqueur absent: +E2E Driver&+Arrêt 1|-Ajouter un arrêt|-Confirmer le lieu|-Où allez-vous|-Chargement ; fg=sn.galass.galassrider (ui-dump)) |
| driver-running-stop1 | FAIL | no MATCH capture: 37-driver-running-stop1 (TIMEOUT ; marqueur absent: +Arrêt 1|-Accepter\s+la\s+course|Prise en charge du client|+Confirmer l.arrêt ; fg=sn.galass.galassdriver (ui-dump)) |
| driver-inride-stops | WARN | écran en course du Driver statique : identique à 37-driver-running-stop1 après 30s, aucun écran distinct à capturer (non bloquant, pas de capture dupliquée) |
| bug-b2-inride-stops | WARN | B2 non concluant: écran de course non atteint (35b) |
| rider-stop1-active | FAIL | no MATCH capture: 22-rider-stop1-active (TIMEOUT ; marqueur absent: +E2E Driver&+Arrêt 1&+Arrêt 2|-Ajouter un arrêt|-Confirmer le lieu|-Où allez-vous ; fg=sn.galass.galassrider (ui-dump)) |
| driver-stop1-done | FAIL | no MATCH capture: 38-driver-stop1-done (TIMEOUT ; marqueur absent: +1/2 arrêts? terminés?|-Accepter\s+la\s+course ; fg=sn.galass.galassdriver (ui-dump)) |
| rider-stop1-done | FAIL | no MATCH capture: 23-rider-stop1-done (TIMEOUT ; marqueur absent: +E2E Driver&+Arrêt 1&+Arrêt 2|-Ajouter un arrêt|-Confirmer le lieu|-En route vers ; fg=sn.galass.galassrider (ui-dump)) |
| driver-stop2-done | FAIL | no MATCH capture: 39-driver-stop2-done (TIMEOUT ; marqueur absent: +2/2 arrêts? terminés?|-Accepter\s+la\s+course ; fg=sn.galass.galassdriver (ui-dump)) |
| rider-stop2-done | FAIL | no MATCH capture: 24-rider-stop2-done (TIMEOUT ; marqueur absent: +E2E Driver&+Arrêt 1&+Arrêt 2&+Destination|-Ajouter un arrêt|-Confirmer le lieu|-En route vers ; fg=sn.galass.galassrider (ui-dump)) |
| ui-stops | FAIL | taps UI confirmés: 0/2 |
| rider-destination-arrived | FAIL | no MATCH capture: 25-rider-destination-arrived (TIMEOUT ; marqueur absent: +Vous êtes arrivé à destination|+Payer maintenant|Facture à payer|-En attente de la réponse du chauffeur ; fg=sn.galass.galassrider (ui-dump)) |
| diag-rider-pusher | FAIL | n=0 pusher=40 fg=sn.galass.galassrider |
| rider-cash-methods | FAIL | no MATCH capture: 26-rider-cash-methods (TIMEOUT ; marqueur absent: +Espèces|Cash|+Wave|Orange Money ; fg=sn.galass.galassrider (ui-dump)) |
| rider-cash-waiting | FAIL | no MATCH capture: 27-rider-cash-waiting (TIMEOUT ; marqueur absent: +En attente de la réponse du chauffeur|-Payer maintenant ; fg=sn.galass.galassrider (ui-dump)) |
| rider-final-itinerary | FAIL | no MATCH capture: 29-rider-final-itinerary (TIMEOUT ; marqueur absent: +Course terminée|-Chargement|-Confirmer le lieu ; fg=sn.galass.galassrider (ui-dump)) |
| driver-cash-request | FAIL | no MATCH capture: 41-driver-cash-request (TIMEOUT ; marqueur absent: +Reçois le paiement|+Confirmer le paiement|+Tarif de la course ; fg=sn.galass.galassdriver (ui-dump)) |
| bug-b5-estimated-time | PASS | pas de « Temps estimé » après la fin |
| driver-cash-confirmed | FAIL | no MATCH capture: 42-driver-cash-confirmed (TIMEOUT ; marqueur absent: +Tarif de la course|Distance|-Reçois\s+le\s+paiement|-Confirmer\s+le\s+paiement ; fg=sn.galass.galassdriver (ui-dump)) |
| driver-summary | FAIL | no MATCH capture: 43-driver-summary (TIMEOUT ; marqueur absent: +En ligne|-Reçois\s+le\s+paiement|Confirmer\s+le\s+paiement|Terminer la course ; fg=sn.galass.galassdriver (ui-dump)) |
| bug-b3-final-timeline | WARN | B3 reproduit: timeline finale à 0 noeuds (29) |
| rider-rating | FAIL | no MATCH capture: 30-rider-rating (TIMEOUT ; marqueur absent: +Avis|Course terminée|-Payer maintenant|-Chargement ; fg=sn.galass.galassrider (ui-dump)) |
| rider-home-after | FAIL | not attempted (harness) |
| bug-b1-dialog-over-home | WARN | no evidence: capture 31 absente ou vide |
| backend-flow | FAIL | see e2e-out/state.json (status/stops/payment) |
| bug-b3-stops-order | PASS | B3: ordre identique (affiché=detail) affiché=['Medina, Dakar, Senegal', 'Fann, Dakar, Senegal'] composé=['Medina, Dakar, Senegal', 'Fann, Dakar, Senegal'] create=? detail=['Medina, Dakar, Senegal', 'Fann, Dakar, Senegal'] |
| no-prod-calls | PASS | 0 galassapp.com occurrence (logcat 65892100 octets) |
| maps-auth | PASS | 0 'Authorization failure' (Google Maps) |
| bug-b4-decline-409 | WARN | non concluant: 0 ride_unavailable, toutes dans la fenêtre de retry du harnais |
| b2-captures | WARN | driver-inride-stops: écran en course statique (voir ce point), offre capturée |

## UI flags

- UI_ACCEPT=0
- UI_CASH=0
- UI_END=0
- UI_START=0
- UI_STOP0=0
- UI_STOP1=0
