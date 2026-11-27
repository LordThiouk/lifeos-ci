# Mini ISATool — ticks ISC-52/53 (Driver OTP) — ISC-10.* déjà cochés

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver` tip ≥ `b1f08b7`.
ISA enfant : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**État tip (ne pas refaire)** :
- OTP restauré : `07b0bbc` (`maskPhone` + `editPhoneNumber`)
- ISC-10 / 10.1 / 10.2 / 10.3 **déjà `[x]`** (Étape3 Aditi `b1f08b7`) — **ne pas retick**

## Scope strict
Cocher **uniquement** ISC-52 et ISC-53. Pas de nouvelle UI. Pas de refactor. Pas Étape3.

## Ordre obligatoire (anti-timeout)
1. Preuves vertes :
   - `flutter test test/presentation/auth/otp_phone_display_test.dart`
   - `flutter test test/core/helper/phone_auth_helper_test.dart`
   - `git show 07b0bbc --stat` (preuve code OTP)
2. **ISATool tick** ISC-52 puis ISC-53 — evidence = sorties tests verts + SHA `07b0bbc` / tip courant
3. **git push**
4. **STOP** immédiat

## Anti
Pas ISC-10.*. Pas Artemis / goldens. Pas signup. Pas `flutter build`. Pas `.fullrun`. Timeout ≤ 20. Auteur Papa Diop.
