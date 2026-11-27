# Point — correction périmètre ISA lot client (ISC-10…10.3)

Date: 2026-11-27 15:25 Africa/Dakar · branche rapports `cursor/reports-galass-chantiers-e410`  
ISA tip: `Galass_backend` `fullrun/lot-client-w0` @ `ee2b9483` · slug `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`  
**Aucun mini build lancé.** **Aucun code admin supprimé.**

## 1. Mauvaise lecture vs intention Papa

| | Livré / coché aujourd’hui | Intention Papa (corrigée) |
|---|---|---|
| ISC-10…10.3 | Admin : une action `approveAll` (dv+vv) + bouton « Valider le chauffeur » | Driver : formulaires **permis** + **véhicule** inchangés (champs, validations, API) sur **un seul écran** |
| Admin validation | Nouveau raccourci + SMS `DRIVER_APPROVE_ALL` | **Garder telle quelle** (routes séparées existantes) |
| Anti | Refus si incomplet ; routes séparées OK | Champs / validations / API / validation admin **ne changent pas** |

État Driver actuel (tip lot / MS) : écrans séparés `driverProfileVerificationScreen` → puis `vehicleVerificationScreen` (`route.dart` ~396–403) ; repos distincts `driverVerificationFormUrl` / `vehicleVerificationFormUrl`.

## 2. Inventaire exact — bouton admin + SMS (ne rien supprimer sans OK)

**Branche de présence du code :** uniquement `origin/fullrun/lot-client-w0` (absent de `main`). Tip @ `ee2b9483`.

**Commits d’origine (hors ancestral tip après salvage ; messages conservés) :**
- `6cab91f4` — S-W1-03 ISC-10 `approveAll` dv+vv  
- `85a8b922` — S-W1-06 ISC-10.3 bouton / route  
- `affa8853` — S-W1-07 ISC-11 SMS FR  

**Sur le tip (contenu effectif) :**
- `b4e54673` (2026-11-26 20:07 UTC) — salvage S-W1-03..18 : `approveAll` + blade + route + tests OneStep/SMS  
- `e8224e1e` — tests approval mock SMS exécutable  
- `fa75f55f` — tests SMS capturé  
- `e94d11c9` — `AdminDriverValidateButtonTest` (route + blade)

**Fichiers tip :**
| Fichier | Quoi |
|---|---|
| `core/app/Http/Controllers/Admin/ManageDriversController.php` | `approveAll` (~184) ; `sendDriverApprovedSms` (~209) ; `ensureDriverApprovedSmsTemplate` act `DRIVER_APPROVE_ALL` |
| `core/routes/admin.php:169` | `POST approve-all/{id}` → `approve.all` |
| `core/resources/views/admin/driver/detail.blade.php:499-502` | Bouton « Valider le chauffeur » → `admin.driver.approve.all` |
| `core/tests/Feature/Admin/DriverOneStepApprovalTest.php` | ISC-10 / 10.1 / 10.2 |
| `core/tests/Feature/Admin/DriverApprovedSmsTest.php` | ISC-11…11.3 |
| `core/tests/Feature/Admin/AdminDriverValidateButtonTest.php` | ISC-10.3 route+blade |

**Comportement :** si document + véhicule complets → `dv=vv=VERIFIED` ; SMS une fois si pas déjà validé ; échec SMS loggé, validation non bloquée. Routes séparées `verification.approve` / `vehicle.approve` **conservées**.

**ISA :** ISC-10…11.3 tous `[x]` sous F1 ; Bridge-4 SMS générique encore `[ ]`.

### Proposition garder / retirer (décision Papa — rien effacé)

| Option | Effet |
|---|---|
| **A — Garder** (proposé) | Raccourci admin + SMS restent un **bonus hors point 1 corrigé**. ISC-11…11.3 restent documentés comme surplus W1. Compatible avec anti « validation admin inchangée » (routes séparées intactes). |
| **B — Retirer** | Après OK explicite seulement : mini forge qui enlève `approveAll`, route, bouton, template auto, 3 fichiers de tests ; untick/retire ISC-11…11.3. |

## 3. ISC réécrites (proposées — à poser via ISATool après OK)

Clé stamp locale ≠ empreinte tip → **pas d’ISATool depuis ce cloud** (sinon provenance-mismatch). Mini-0 FullRun appliquera `replace` / `untick` / `append` Decisions avec `ISA_STAMP_KEY` secret.

### F1 · Écran unique KYC Driver (point 1 corrigé)

Why: le chauffeur voit permis et véhicule sur un seul écran ; les formulaires et l’admin restent ceux d’aujourd’hui.

- [ ] **ISC-10:** Sur le Driver, les formulaires permis (`DriverProfileVerification` / `driverVerificationFormUrl`) et véhicule (`VehicleVerification` / `vehicleVerificationFormUrl`) restent **séparés** (mêmes champs, mêmes validations, mêmes envois API) mais s’affichent sur **un seul écran** (sections / scroll), à la place de la navigation multi-écrans actuelle. [app: Driver · classe: nouvelle fonctionnalité · preuve: flutter test + capture Artemis avant/après]
- [ ] **ISC-10.1:** Anti: aucun changement des champs, des validations client, des payloads ni des endpoints d’envoi par rapport à l’existant. [app: Driver · classe: correctif dû · preuve: flutter test + diff repos/contrôleurs sans changement API] (after: ISC-10)
- [ ] **ISC-10.2:** Anti: la validation admin reste telle quelle — `verification.approve` / `verification.reject` / `vehicle.approve` / `vehicle.reject` inchangés ; pas d’exigence de nouvelle action admin pour le point 1. [app: backend+admin · classe: correctif dû · preuve: phpunit routes existantes] (after: ISC-10)
- [ ] **ISC-10.3:** Capture Artemis avant/après de l’écran Driver unique (permis + véhicule visibles sans enchaînement multi-étapes) ; **goldens existants relancés, jamais régénérés**. [app: Driver · preuve: Artemis avant/après + relaunch goldens] (after: ISC-10)

**ISC-11…11.3 :** non réécrits ici — surplus W1 ; statut final = option A ou B ci-dessus.

**Décision à noter (ISATool append) :**  
`2026-11-27 — Correction Papa périmètre ISC-10…10.3 : mauvaise lecture admin one-step ; intention = écran Driver unique permis+véhicule, mêmes champs/API, admin validation inchangée. Code approveAll+SMS inventorié sur fullrun/lot-client-w0 ; suppression interdite sans OK. ISC-11…11.3 en attente A garder / B retirer.`

## 4. Plan mini builds (après OK Papa — pas lancé)

| # | Mini | Dépôt / branche | Contenu | Preuve |
|---|---|---|---|---|
| **0** | ISATool périmètre | `Galass_backend` `fullrun/lot-client-w0` | replace ISC-10…10.3 ; untick 10…10.3 ; append Decision ; F1 Why + Test Strategy alignés ; **pas** de delete code | `ISATool verify` OK ; progress recalculé |
| **1** | Artemis **avant** | Driver + Artemis | Capture écran(s) KYC multi-étapes actuel | Artifact avant |
| **2** | Forge UI écran unique | `Galass_Driver` tip lot | Un écran, deux formulaires/sections, mêmes controllers/repos/submit | `flutter test` ; analyze |
| **3** | Artemis **après** + goldens | Driver + Artemis / emu | Capture après ; **relaunch** goldens existants (**jamais** régénérer) | Avant/après + goldens verts |
| **4a** | Si Papa **A** | — | Aucun delete ; ISC-11 restent surplus documenté | Decision A |
| **4b** | Si Papa **B** | `Galass_backend` tip | Retrait `approveAll`+SMS+tests (OK explicite seulement) | phpunit vert sans ces tests |

Contraintes : Features-first ; goldens relaunch-only ; Verify×3/merge seulement sur OK Papa ; pas de secrets.

## 5. Attente

1. OK wording ISC-10…10.3 → lance Mini-0 ISATool  
2. Tranche **A garder** / **B retirer** pour admin one-step+SMS  
3. Puis Mini-1→3 (Driver écran unique + Artemis + goldens)
