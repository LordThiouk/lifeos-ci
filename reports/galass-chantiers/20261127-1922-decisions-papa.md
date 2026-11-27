# Décisions Papa 27/11 19:22 — exécution

Africa/Dakar · rapport agent cloud

## 1. Goldens — faits mesurés (run Artemis 46055061159)

| | |
|---|---|
| Workflow branch | `cursor/artemis-ms-close-b7-ids-e410` @ `737325b` |
| Flutter Artemis | **3.50.1** (pin invalide — Papa) |
| Rider | branche demandée `feat/multistop-rider-close-2026-11-20` → SHA **`0fe56d0c3682b00cb997b277523d0d0dc237b4db`** |
| Driver | `feat/lot-w2-driver` → SHA **`64bdffd9e5d00f9fc8e76be83d896950497332fc`** |
| `b83aba6` (regen 3.50.1) | **PAS** ancêtre de `0fe56d0` — présent sur `feat/multistop-e2e-2026-11-15` / build branches uniquement |
| Verdict golden 46055061159 | **INVALIDE** (Flutter 3.50.1) ; `course_en_cours_*` ~12–13 % |

Correctif Artemis : pin ramené à **3.44.8** (cette PR emu).

### Driver 2–4 px (run 46027600691, Flutter **3.44.8**)

Mesures log CI (pas regen) :
- `driver_ride_running_single_stop` : **0.00 %, 4 px**
- `…_stop_1_active` / `…_stop_2_active` : **0.00 %, 4 px**
- `…_all_stops_done` : **0.00 %, 2 px**

Checkout ce run : Rider `d989ed1` · Driver `feat/multistop-e2e-2026-11-15`.
Artifacts `failures/` chiffrés → planche pixel absente des preuves publiques.
Preuve factuelle : `preuves/goldens/driver_ride_running_2_4px_mesure_ci_460276.png` (réf PNG + mesures).
Un autre fail local 6 % (bande couleur y≈768–823) **n’est pas** le cas 2–4 px : `preuves/goldens/driver_ride_running_single_stop_OTHER_6pct_color_band_NOT_2_4px.png`.

## 2. UI — code appliqué

### Driver ISC-10 RETIRÉ
Branche `cursor/isc10-revert-separate-kyc-e410` :
- `DriverKycScreen` / route / nav **supprimés**
- Post-auth = chaînage `driverProfileVerification` → `vehicleVerification` (comme main)
- ISC-22.1 : `WidgetsBindingObserver` + refresh sur **les deux écrans séparés**
- ISA enfant : ISC-10/10.x untick + marque « RETIRÉ, décision Papa 27/11 » (ISATool) → **19/30**

### Rider F4-26 RETIRÉ
Branche `cursor/f4-26-revert-main-screen-e410` (base `0fe56d0`) :
- `buildMessageButton` retiré ; tuile notes = main
- `ride_details_bottom_sheet_widget.dart` **identique à `origin/main`** après retrait
- Contrat test F4-26 = absence du bouton ; ISA F4-26 untick + RETIRÉ

### F4-27 — signal AVANT touche (Papa)
Sur tip actuel `feat/multistop-rider-close-2026-11-20` (`bf9dcb6`) : `stopsProgressText` + `currentLegBanner` **divergent de main**.
Sur `0fe56d0` (checkout Artemis) : **pas** ces bandeaux dans le bottom sheet.
→ **Je n’ai pas touché F4-27.** Décision Papa requise avant edit.

## 3. ISC-22 / 22.1
Code refresh remis sur écrans séparés. **Preuve device absente** (2 captures émulateur id>900000 + log) → ISC-22/22.1 restent **[ ]** parent et Driver.
Diapos texte / captures widget = rejetées.

## 4. ISC-81 / CallKit
Code ISC-81.1 déjà 12/12. Preuve device Artemis (offer_timeout 45 s) **à lancer**.
CallKit (`dispatch_callkit_service.dart:87`) : `duration: Environment.bidAcceptSecond * 1000` avec **`bidAcceptSecond = 30` fixe** dans `environment.dart` — **oui, risque** si staging `offer_timeout=45` : CallKit coupe à 30 s pendant que le modal compte 45. **Pas modifié** (attente OK Papa).

## 5. Sync ISA parent ↔ enfants

| Claim | Parent `2026-11-22-galass-lot-client` | Enfant Driver | Action |
|---|---|---|---|
| ISC-22 / 22.1 | [ ] / [ ] | [ ] / [ ] | inchangé (pas de preuve device) — Papa croyait parent [x] ; **les deux étaient [ ]** |
| ISC-23 / 23.1 | **[x]/[x]** (tick ISATool ce tour) | [x]/[x] | sync OK |
| ISC-10 UI Driver | n/a (parent ISC-10 = admin) | RETIRÉ | admin parent inchangé |

**Compteurs réels :**
- Parent lot : **40/64**
- Driver enfant : **19/30** (après retrait ISC-10*)
- Rider multistop ISA : **30/39** (F4-26 untick)

## 6. Suite mini builds (sans arrêt)
Driver 50 / 80 / 82 · Rider 50 · MS FCM 61.x / F18 / bridges / 56.1 · Artemis P0 500 m · ISC-22 captures · ISC-81 offer_timeout.
Deploy ISC-21/24 : **attente GO Papa**.

## 7. Merge
Aucune ISA complète → pas de verify×3 → **pas de demande OK merge**.
