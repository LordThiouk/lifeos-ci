# Mini ISATool — ticks ISC-10/10.1 + ISC-52/53 (Driver)

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver`.
ISA enfant : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope** — preuves vertes + ticks ISA. Pas de nouvelle UI hors restauration OTP ci-dessous. Pas de refactor.

Code déjà sur tip (à vérifier) :
- KYC écran unique Étape 2 : tip ≥ `db8ad6a` (`DriverKycScreen`) — **ne pas retoucher**
- OTP : tip `4604522` a les tests + appels UI, mais l’autosave a figé un état **incomplet** (`PhoneAuthHelper.maskPhone` et `FirebasePhoneAuthController.editPhoneNumber` / `_retainRegistrationFieldsAcrossNav` absents) — **restaurer uniquement si manquant**

## Préflight OTP (si tip cassé)
Si `dart analyze` / tests OTP échouent faute de `maskPhone` ou `editPhoneNumber` :
1. Ajouter `PhoneAuthHelper.maskPhone` → `+<dial> <2premiers>•…•<2derniers>` (ex. `+221 77•••••67`)
2. Restaurer sur le controller : `_retainRegistrationFieldsAcrossNav`, `_refresh`, `editPhoneNumber` (back si previousRoute = cible, sinon `offAllNamed` + retain phone/noms inscription)
3. `resetPhoneAuthSession` doit respecter le retain noms ; ne pas changer E.164 (`normalizeE164` / `localDigits`)

## Ordre obligatoire (anti-timeout)
1. Préflight OTP si besoin (ci-dessus) — commit `fix(otp): restaurer maskPhone + Modifier (ISC-52/53)`
2. Rejouer preuves (doivent être verts) :
   - ISC-10 / 10.1 : `flutter test test/presentation/kyc/driver_kyc_single_screen_test.dart` + `git show db8ad6a --stat`
   - ISC-52 / 53 : `flutter test test/presentation/auth/otp_phone_display_test.dart test/core/helper/phone_auth_helper_test.dart`
3. Si ISC-10 / 10.1 absents des Criteria/Features : les ajouter (même texte que le parent / Étape 2), puis **ISATool tick** ISC-10, ISC-10.1, ISC-52, ISC-53 — evidence = sorties tests verts + SHA tip
4. **git push** (ne pas compter sur un push agent si le workflow le fait — s’assurer que le tip distant avance)
5. **STOP** immédiat

## Anti
Pas Étape 3 / Artemis. Pas regen goldens. Pas KYC code change. Pas signup. Pas `flutter build`. Pas `.fullrun`. Timeout ≤ 25. Auteur Papa Diop.
