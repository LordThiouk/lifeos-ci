# SoT S — Rider MS : absorb frise + ISATool reconcile

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`** (PR SoT #24).
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

Auteur commits : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
Règles : Flutter **3.44.8**, **aucun golden régénéré**, pas de `flutter build`, pas de push `main`, pas de `.fullrun`, scope strict.

## Décisions Papa (recopier en Decisions via ISATool)

- Pas de marqueur de test dans l'app. Pas de bandeau « En route vers », pas de bouton message, pas de x/N.
- Frise Rider = look Driver (**validée** Papa) : gris+barré si fait, **orange** sinon (pas d'état muted « à venir »).
- Ordre merge futur : multistop d'abord, puis lot rebasé.
- Ligne e2e `feat/multistop-e2e` 42/42 = **archivée** — ne pas merger.

## Scope

1. **Frise E2b** (slice #34, tip `583ebb5`) — appliquer le diff sur `lib/presentation/screens/ride/widget/ride_itinerary_timeline.dart` + tests unitaires associés (`multistop_itinerary_test` + capture stop1-fait si utile). Base close a divergé de e2e : résoudre conflits en gardant design close F4-27 **et** règle orange=non-fait. Ne pas régénérer goldens.
2. **ISATool** (jamais Edit/Write/sed sur ISA.md) :
   - F4-20 = obsolète (décision Papa 27/11) — untick / marquage RETIRÉ si encore ouvert.
   - F4-26 = retiré (pas de bouton message) — rester cohérent Anti-bandeaux.
   - Noter frise Papa validée + absorb #29 ACTIVE poll déjà au tip.
   - Ce que Papa a décoché **reste** décoché sans preuve device.
3. Un ou deux commits. `flutter test` ciblé sur tests touchés (3.44.8 si dispo, sinon documenter). Push branche feat uniquement. **STOP**.

## Hors scope

#30 map-leg, #25 Flutter 3.50.1, #33 goldens, lot-client, Verify, Max, Artemis, merge main.
