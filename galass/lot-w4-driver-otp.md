# Lot-client W4 Driver — OTP Modifier le numéro (ISC-52 + 53)

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver`. ISA enfant : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

**Scope strict :**
1. ISC-52 — écran OTP : numéro masqué + lien « Modifier » → retour saisie préremplie (`flutter test` widget)
2. ISC-53 — normalisation E.164 (`PhoneAuthHelper`, 221) inchangée ; pas de numéro en clair dans logs release

Note : ISC-50 (captures « avant ») = device/Papa — consigner l'hypothèse en Decisions si captures absentes, ne pas bloquer 52.

## Ordre obligatoire (anti-timeout après livraison)
1. Tests verts (TDD rouge→vert)
2. **ISATool tick** ISC-52 puis ISC-53 (preuve = commande + sortie + SHA)
3. **git push**
4. **STOP** immédiat — ne pas enchaîner d’autres tâches

Hors scope : caméra, location 23, `flutter build`. Un ISC = un commit + test. Auteur Papa Diop. Pas `.fullrun`. Timeout ≤ 25.
