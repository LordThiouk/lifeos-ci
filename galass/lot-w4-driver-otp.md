# Lot-client W4 Driver — OTP Modifier le numéro (ISC-52 + 53)

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver`. ISA enfant : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope strict :**
1. ISC-52 — écran OTP : numéro masqué + lien « Modifier » → retour saisie préremplie (`flutter test` widget)
2. ISC-53 — normalisation E.164 (`PhoneAuthHelper`, 221) inchangée ; pas de numéro en clair dans logs release

Note : ISC-50 (captures « avant ») = device/Papa — consigner l'hypothèse en Decisions si captures absentes, ne pas bloquer 52.

Hors scope : caméra, location 23, `flutter build`. Un ISC = un commit + test. ISATool tick. Auteur Papa Diop. Pas `.fullrun`.
