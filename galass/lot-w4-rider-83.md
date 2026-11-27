# Mini Rider W3b — ISC-83 / 83.2 seulement (slice 1/2 post-76)

Dépôt `Galass_Rider`, branche `feat/lot-w2-rider`.
ISA enfant : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`.

**Contexte :** ISC-76 déjà `[x]` au tip. Ancien forge `lot-w3b-rider-76` trop long → **ce mini remplace la 1ʳᵉ moitié**.

## Scope strict

- ISC-83 : pas de crash natif N allers-retours carte (preuve outil : test et/ou logcat sans FATAL).
- ISC-83.2 : écran « aucun chauffeur » FR après `noDriver` (capture / test).

## Hors scope

ISC-84/84.1, ISC-76 (déjà vert), login/OTP, `flutter build`/`gradle`. Timeout cible ≤ 25 min. ISATool tick uniquement sur preuve. Auteur Papa Diop. Pas `.fullrun`.
