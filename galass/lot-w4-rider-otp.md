# Lot-client W4 Rider — OTP + phone-auth enfant (ISC-51 + 53 + 5)

Dépôt `Galass_Rider`, branche `feat/lot-w2-rider`. ISA enfant : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`.

**Scope strict :**
1. ISC-5 — avant code login/OTP : ISC enfant `ISC-N.1` dans l'ISA phone-auth (pas de renumérotation) ; via ISATool uniquement
2. ISC-51 — écran OTP : numéro masqué + lien « Modifier » → retour saisie préremplie (`flutter test` widget)
3. ISC-53 — normalisation E.164 inchangée ; pas de numéro en clair dans logs release

Note : ISC-50 (captures « avant ») = device/Papa — consigner l'hypothèse en Decisions si captures absentes, ne pas bloquer 51.

Hors scope : 76/83/84 (autres jobs), `flutter build`. Un ISC = un commit + test. ISATool tick. Auteur Papa Diop. Pas `.fullrun`.
