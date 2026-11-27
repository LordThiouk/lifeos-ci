# Lot-client W4 — écran inscription qui ne se rafraîchit pas (ISC-22) — Driver

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver`.
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope strict :**
1. ISC-22 — identifier l'écran exact (app + écran) ; verdict REPRODUIT/NON REPRODUIT en Decisions (captures/log si dispo ; sinon lecture code + verdict documenté)
2. ISC-22.1 — si REPRODUIT : correctif + `flutter test` rouge→vert ; sinon BUGS.md OBSOLÈTE avec preuve
3. Si correctif UI : capture widget test sous `test/artifacts/` pour le rapport Papa

## Ordre obligatoire (anti-timeout)
1. Preuves (tests verts / verdict)
2. **ISATool tick** ISC-22 / 22.1
3. **git push**
4. **STOP** immédiat

Hors scope : caméra/OTP/location/KYC, `flutter build`. Pas `.fullrun`. Timeout ≤ 25. Auteur Papa Diop.
