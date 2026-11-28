# Artemis B lot — FAIL avant émulateur — STOP

Run [46136273715](https://github.com/LordThiouk/galass-emu-actions-pub/actions/runs/46136273715) · `scenario=lot` lane b · Flutter 3.44.8 · IDs 900406/900323.

## Cause (pas GLES)

Échec step **« Tests du harnais (syntaxe + contrats) »** :
- job env `SCENARIO=lot` fuitait dans `test_ci_direct_harness.py`
- specs appelaient `e2e/lot_flow.sh` absent du sandbox → 2/12 PASS
- regex step `E2E multistop` cassée après rename `E2E ${{ inputs.scenario }}`

**Émulateur jamais démarré** — pas de GLES/EGL/virtualscene à juger.

## Fix poussé (sans relaunch)

`cursor/artemis-2lanes-e410` : isole `SCENARIO=multistop` dans les unit tests + regex step + garde `lot_flow.sh` absent.  
**Pas de 2e essai Artemis** jusqu’à OK Papa.
