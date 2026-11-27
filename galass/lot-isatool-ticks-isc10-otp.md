# Mini ISATool — ticks ISC-10/10.1 + ISC-52/53 (Driver)

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver`.
ISA enfant : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope strict — ticks seulement.** Pas de nouvelle UI. Pas de refactor. Code déjà sur tip :
- KYC écran unique Étape 2 : tip ≥ `db8ad6a` (`DriverKycScreen`)
- OTP masque + Modifier : tip ≥ `4604522` (`phone_auth_helper` + `otp_phone_display_test`)

## Ordre obligatoire
1. Rejouer preuves (doivent être verts) :
   - ISC-10 / 10.1 : `flutter test` ciblé écran KYC unique (permis + véhicule sur un écran) + `git show db8ad6a --stat`
   - ISC-52 / 53 : `flutter test test/presentation/auth/otp_phone_display_test.dart test/core/helper/phone_auth_helper_test.dart` + `git show 4604522 --stat`
2. **ISATool tick** ISC-10, ISC-10.1, ISC-52, ISC-53 — evidence = sorties tests verts + SHA (`db8ad6a` / `4604522` / tip courant)
3. **git push**
4. **STOP** immédiat

## Anti
Pas Étape 3 / Artemis. Pas regen goldens. Pas OTP/KYC code change. Pas `flutter build`. Pas `.fullrun`. Timeout ≤ 25. Auteur Papa Diop.
