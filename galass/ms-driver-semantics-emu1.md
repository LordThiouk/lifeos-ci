# Mini — Semantics Driver + harnais ISC-EMU-1

## Cible A — Driver (si Semantics manquant sur branche de travail)

Dépôt `Galass_Driver`, branche `feat/multistop-e2e-2026-11-15` (MS) **ou** sync vers lot si Papa le demande.
Contrat **ISC-F5-14** : un nœud `Semantics` invisible, `content-desc` / label exact `galass.driver.stops=<done>/<total>`, monté ssi `ride.stops` non vide. Test : `test/unit/multistop_stops_progress_test.dart`.

Au tip MS le marqueur est **déjà présent** — ne pas retoucher `lib/` si tests verts. Documenter SHA + preuve dans Decisions.

## Cible B — Harnais emu (ISC-EMU-1)

Dépôt `galass-emu-actions-pub`, branche de travail e2e (ex. `cursor/e2e-high-test-ids-e410` ou branche MS harnais).
ISA harnais golden : consommer `galass.driver.stops=<done>/<total>` (miroir Rider F4-22).

## Règles

- Goldens existants : **relancer**, **jamais régénérer**.
- ids test > 900000.
- Timeout ≤ 25 min. ISATool tick sur preuve. Auteur Papa Diop. Pas secrets. Pas `flutter build` local.
