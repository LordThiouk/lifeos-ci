# Forge — harnais Artemis scénario lot (Papa GO 10:20)

Dépôt **`galass-emu-actions-pub`**, branche **`cursor/artemis-2lanes-e410`**.
Un chantier = harnais uniquement. **Aucun** dépôt Galass.

Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

## Décision Papa

Coder mini-scénario **lot** : `scenario=multistop|lot` (défaut multistop).  
**P0_DEFAULT et seuils P0 INTOUCHÉS** (byte-identique). Lane A : GPU **G1** `-gpu angle_indirect`.

## Travail

### 1. Workflow `.github/workflows/artemis-staging-e2e.yml`

- Input `scenario` choice `multistop|lot`, default `multistop`.
- Concurrency : `artemis-staging-e2e-${{ inputs.lane }}-${{ inputs.scenario }}`.
- IDs :
  - multistop a: 900106/900023 ; b: 900206/900123
  - lot a: 900306/900223 ; b: 900406/900323
- `OUT: e2e-out-${{ inputs.lane }}-${{ inputs.scenario }}`
- Flutter **3.44.8** inchangé pour Rider+Driver.
- `emulator-options` :
  - GPU : lane `a` → `-gpu angle_indirect` ; lane `b` → `-gpu swiftshader_indirect` (sauf si déjà G1 partout demandé — **seulement lane A = G1**).
  - Caméra : `scenario=lot` → `-camera-back virtualscene` ; sinon `-camera-back none`.
- Step E2E : si `SCENARIO=lot` → `bash e2e/ci-opencode-run.sh run` doit appeler `lot_flow.sh` (voir ci-dessous). Env `SCENARIO=${{ inputs.scenario }}`.

### 2. `e2e/report.py`

- Ajouter `P0_LOT = """...""".split()` (liste ci-dessous).
- **Ne pas modifier** la chaîne/liste `P0_DEFAULT` ni les seuils.
- Étendre `UI_POINTS` **ou** `UI_POINTS_LOT` pour les points lot-* qui reposent sur capture (sans retirer de P0_DEFAULT).
- Test : `test_p0_default_unchanged` + `test_p0_lot_disjoint` (aucun point lot dans P0_DEFAULT).
- `test_p0_default_matches_run_sh` doit **toujours** passer (run.sh `P0_POINTS` inchangé).

`P0_LOT` :
```
api-preflight apk-base-url emulator-boot apk-install
lot-rider-camera-ok lot-rider-camera-denied
lot-driver-camera-profile lot-driver-camera-permit lot-driver-camera-vehicle
lot-driver-camera-denied
lot-kyc-refresh lot-rider-kyc-refresh
no-prod-calls
```

### 3. `e2e/lot_flow.sh` (nouveau)

- Bootstrap calqué sur début de `run.sh` (api-preflight, apk-base-url, emulator-boot, apk-install, prefs, logcat stream) — **ne pas** exécuter le parcours multistop.
- `P0_POINTS` = P0_LOT (export + `--p0` vers report.py).
- Marqueurs MARK_* + `cap lot-*` avec sidecars MATCH (réutiliser `cap`/`mark` de ui.sh patterns).
- Étapes :
  - **L1** Rider profil → Prendre une photo (ou équivalent image_picker) avec permission caméra accordée (`adb shell pm grant … CAMERA`) → `lot-rider-camera-ok` + grep logcat sans FATAL.
  - **L2** Revoke CAMERA → retenter → message FR (`Autorisation refusée` / message caméra Driver strings ou Rider équivalent) → `lot-rider-camera-denied` + logcat sans FATAL.
  - **L3** Driver : profil / permis (KYC) / véhicule → 3 caps `lot-driver-camera-profile|permit|vehicle` avec caméra OK.
  - **L4** Driver deny permission → `lot-driver-camera-denied` + message FR + logcat sans FATAL.
  - **L5** Admin valide KYC via API staging (documenter l’endpoint utilisé) → refresh Driver pending→verified `lot-kyc-refresh` ; Rider inscription refresh `lot-rider-kyc-refresh`. Si endpoint admin absent : mark FAIL détail clair, **ne pas inventer**.
  - **L6** Si OTP/Bridges déjà instrumentés dans le harnais : les enchaîner. Sinon : mark SKIP + fichier `e2e/LOT_L6_GAPS.md` listant le manque pour ISC-50, 80–84, Bridge-1/2/4.
- Fin : logcat scan no-prod-calls + `report.py --p0` P0_LOT.

### 4. `e2e/ci-opencode-run.sh`

- Si `SCENARIO=lot` : exécuter `bash e2e/lot_flow.sh` à la place de `bash e2e/run.sh` (même budget/verdict). Multistop inchangé.

### 5. Tests harnais

- `bash -n e2e/*.sh` ; `python3 -m py_compile e2e/*.py` ; tous `e2e/tests/test_*.py` verts.
- Aucune ligne de `P0_DEFAULT` changée (preuve : `git diff` ne touche pas le littéral P0_DEFAULT).

### 6. Commit + push branche. STOP.

Pas d’Artemis launch dans ce job. Pas de merge main. Pas de secrets affichés.
Si `virtualscene` ne peut pas être validé localement : l’écrire dans le commit message ; le premier run Artemis dira STOP si GLES/caméra KO.
