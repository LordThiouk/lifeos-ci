# Forge Rider MS — ISC-F4-24 SEUL (Papa 15:40 séquence)

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

Carry tip attendu : `chore(fullrun): carry signé` (wip OFF). **Un seul ISC** : **ISC-F4-24**.

## Scope

Nouvelle course sur un `RideMapController` déjà enregistré (2e `RideDetailsScreen.initState`) — aucun marker / polyline / `driverLatLng` de la course précédente ne survit avant le premier `getMarkers()` de la nouvelle course.

Verrou de régression (Papa 2026-11-23) : **conserver tel quel, ne pas affaiblir** le test.

## Preuve

- Flutter **3.44.8**
- `flutter test test/unit/multistop_map_controller_reset_test.dart` (et uniquement ce qui est requis pour F4-24)
- ISATool tick **ISC-F4-24** seulement + Decisions

## Anti-claims

- Ne pas toucher F4-23, Bridge-F17-3, stop_completed, F4-32/33, F4-29.
- **Aucun** `--update-goldens` / regen PNG.
- Pas de merge `main`. Pas Artemis.

## STOP

Un commit code si nécessaire (+ commit ISA si coche). **STOP** (le workflow pousse). Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
