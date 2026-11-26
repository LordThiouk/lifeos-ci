# Driver F6 — ISC-F5-13 Annuler = danger (reprise après cancel file)

Dépôt Galass_Driver, branche **build/driver-f5-13c** (tip feat @ 32607ee goldens 3.50.1). ISA : `MEMORY/WORK/20261006-galass-driver-multistop/ISA.md`.

Fais UNIQUEMENT ISC-F5-13 : « Annuler la course » reste visuellement distinct (couleur danger) du CTA principal, tout état. Preuve : `flutter test test/unit/multistop_end_gate_test.dart` (+ analyze fichiers touchés). Coche ISC-F5-13 via ISATool avec preuve. **Ne régénère aucun golden.** Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`.
