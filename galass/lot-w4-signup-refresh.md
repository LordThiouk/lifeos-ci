# Lot-client W4 — écran inscription qui ne se rafraîchit pas (ISC-22)

Deux jobs possibles (un dépôt par run) :
- Driver `@feat/lot-w2-driver` ISA `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`
- Rider `@feat/lot-w2-rider` ISA `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`

**Scope strict :**
1. ISC-22 — identifier l'écran exact (app + écran) ; verdict REPRODUIT/NON REPRODUIT en Decisions (captures/log si dispo ; sinon lecture code + verdict documenté)
2. ISC-22.1 — si REPRODUIT : correctif + `flutter test` rouge→vert ; sinon BUGS.md OBSOLÈTE avec preuve

Hors scope : caméra/OTP/location, `flutter build`. Un dépôt = un run. ISATool tick. Auteur Papa Diop. Pas `.fullrun`.
