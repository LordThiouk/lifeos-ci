# Rider F4-32 — mini étape A5 fix test pump (2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15, tête 207ff10 (a4 BLOCK : 133 pass / 1 fail). ISA : MEMORY/WORK/20261006-galass-rider-multistop/.
Fais UNIQUEMENT ceci : corrige le seul échec `test/unit/multistop_map_test.dart` ISC-F4-32 « two live_location events move the car marker » (≈ L588) — défaut de pump / ticker (`pump(3s)` trop tôt après `forward()` ; un `pump()` avant la durée suffit d'après a4). Ne change pas le code prod sauf si la preuve montre un vrai bug dans `updateDriverLocation` (alors fix minimal).
Interdit : régénérer/modifier un golden ; toucher a1–a3 hors nécessité. Relance `flutter test test/unit/multistop_map_test.dart` (et la suite ciblée a4 si rapide). Si vert : coche F4-32 via ISATool. Sinon BLOCK, ne coche pas.
Un petit commit. Galass_backend lecture seule. Pas de revue. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
