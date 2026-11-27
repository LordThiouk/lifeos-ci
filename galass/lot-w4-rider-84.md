# Mini Rider W3b — ISC-84 / 84.1 seulement (slice 2/2 post-76)

Dépôt `Galass_Rider`, branche `feat/lot-w2-rider`.
ISA enfant : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`.

**Contexte :** slice 2 après `lot-w4-rider-83`. Pas de run 60 min.

## Scope strict

- ISC-84 : état paiement Rider ≤ 5 s après événement serveur (preuve horodatée / test).
- ISC-84.1 : si REPRODUIT → correctif TDD ; sinon OBSOLÈTE documenté.

## Ordre obligatoire (anti-timeout après livraison)
1. Preuve / tests verts
2. **ISATool tick** (preuve = commande + sortie + SHA)
3. **git push**
4. **STOP** immédiat — ne pas enchaîner d’autres tâches

## Hors scope

ISC-83*, ISC-76, login/OTP, `flutter build`. Timeout ≤ 25 min. Auteur Papa Diop. Pas `.fullrun`.
