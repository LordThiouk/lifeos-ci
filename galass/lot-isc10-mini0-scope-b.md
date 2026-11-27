# Lot-client Mini-0 — périmètre ISC-10 + retrait B approveAll/SMS

Dépôt `Galass_backend`, branche `fullrun/lot-client-w0`.
ISA : `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`.

Auteur commits : Papa Diop. Pas de `.fullrun`. Pas de secrets. Un commit logique à la fois. **ISATool.ts uniquement** pour toute mutation ISA (stamp `ISA_STAMP_KEY`).

## A — ISATool (obligatoire, d’abord)

ISA = `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`. Outil : `bun LIFEOS/TOOLS/ISATool.ts` (clé env déjà fournie).

### 1. Remplacer F1 titre + Why (replace exact unique)

old:
```
### F1 · Validation chauffeur et SMS (points 1 et 6)
Why: l'admin valide un chauffeur complet d'un seul geste et le chauffeur en est informé par SMS.
```
new:
```
### F1 · Écran unique KYC Driver (point 1 corrigé) + surplus admin retiré
Why: le chauffeur voit permis et véhicule sur un seul écran ; les formulaires et la validation admin séparée restent ceux d'aujourd'hui ; le raccourci admin one-step+SMS est retiré (décision Papa 27/11).
```

### 2. Remplacer ISC-10…10.3 (un replace par ligne, old exact)

ISC-10 new (garder le préfixe `- [x]` pour l’instant — untick juste après) :
```
- [x] ISC-10: Sur le Driver, les formulaires permis (`DriverProfileVerification` / `driverVerificationFormUrl`) et véhicule (`VehicleVerification` / `vehicleVerificationFormUrl`) restent séparés (mêmes champs, mêmes validations, mêmes envois API) mais s'affichent sur un seul écran (sections / scroll), à la place de la navigation multi-écrans actuelle. [app: Driver · classe: nouvelle fonctionnalité · preuve: flutter test + capture Artemis avant/après]
```

ISC-10.1:
```
- [x] ISC-10.1: Anti: aucun changement des champs, des validations client, des payloads ni des endpoints d'envoi par rapport à l'existant. [app: Driver · classe: correctif dû · preuve: flutter test + diff repos/contrôleurs sans changement API] (after: ISC-10)
```

ISC-10.2:
```
- [x] ISC-10.2: Anti: la validation admin reste telle quelle — `verification.approve` / `verification.reject` / `vehicle.approve` / `vehicle.reject` inchangés ; pas d'exigence de nouvelle action admin pour le point 1. [app: backend+admin · classe: correctif dû · preuve: phpunit routes existantes] (after: ISC-10)
```

ISC-10.3:
```
- [x] ISC-10.3: Capture Artemis avant/après de l'écran Driver unique (permis + véhicule visibles sans enchaînement multi-étapes) ; goldens existants relancés, jamais régénérés. [app: Driver · preuve: Artemis avant/après + relaunch goldens] (after: ISC-10)
```

Puis **untick** ISC-10, ISC-10.1, ISC-10.2, ISC-10.3 avec reason citant la correction Papa 27/11 (mauvaise lecture admin → écran Driver ; pas encore livré).

### 3. ISC-11…11.3 — marquer retirés (replace + untick)

Pour chaque ISC-11, ISC-11.1, ISC-11.2, ISC-11.3 : replace le texte de claim pour préfixer / remplacer par une forme claire **« retiré, décision Papa 27/11 »**, puis **untick** avec reason `retiré, décision Papa 27/11 — code approveAll/SMS retiré`.

Exemple ISC-11 new:
```
- [x] ISC-11: retiré, décision Papa 27/11 — surplus admin one-step SMS (DRIVER_APPROVE_ALL) hors périmètre point 1. [app: backend · classe: nouvelle fonctionnalité · preuve: n/a — retiré]
```
(idem 11.1–11.3, untick après).

### 4. append Decisions

```
- **2026-11-27 — Correction Papa périmètre ISC-10…10.3.** Mauvaise lecture : admin one-step. Intention : écran Driver unique permis+véhicule, mêmes champs/API ; validation admin séparée inchangée. **B — retirer** approveAll + route `approve.all` + bouton « Valider le chauffeur » + 3 tests (`DriverOneStepApprovalTest`, `DriverApprovedSmsTest`, `AdminDriverValidateButtonTest`). ISC-11…11.3 : retiré, décision Papa 27/11. Goldens relaunch-only ; Artemis avant/après écran Driver.
```

### 5. Test Strategy + antis Features

Aligner les lignes table ISC-10…11.3 et les puces Anti F1 qui pointent encore vers l’ancienne lecture (replace exact). `ISATool verify` doit passer.

Ne **pas** cocher ISC-10…10.3 (Driver UI pas encore faite). Mettre à jour `progress` frontmatter si l’outil / Completeness l’exige après untick (38/64 → compter les [x] restants).

## B — Code (même mini, après ISA)

Retirer **uniquement** :
1. `ManageDriversController` : méthodes `approveAll`, `sendDriverApprovedSms`, `ensureDriverApprovedSmsTemplate` (+ usings devenus morts)
2. Route `approve-all/{id}` / `approve.all` dans `core/routes/admin.php`
3. Bouton « Valider le chauffeur » dans `core/resources/views/admin/driver/detail.blade.php`
4. Supprimer les 3 fichiers de tests listés ci-dessus

**Garder intact** : `verificationApprove`, `verificationReject`, `vehicleApprove`, `vehicleReject` et leurs routes/boutons.

Preuve : `php artisan test --filter=ManageDrivers` ou grep routes + un test existant des routes séparées s’il existe ; sinon nouveau test minimal **uniquement** si nécessaire pour prouver que les 4 routes séparées répondent (pas de réintroduction approveAll).

Commit messages FR, auteur Papa Diop. Push sur `fullrun/lot-client-w0`.

## Hors scope
Flutter Driver UI (étapes 1–3), Artemis, goldens regen, merge main, Verify×3.
