# E1 — Retrait marqueurs Driver + harnais textes visibles

**Date** : 2026-11-28 04:45 Africa/Dakar (UTC+0)  
**Étape** : E1 uniquement — **STOP** (pas E2)  
**Flutter** : 3.44.8 (`/home/ubuntu/flutter-3.44.8`)  
**Aikido** : scan demandé — MCP Aikido non authentifié sur cette box (pas de sign-in Cursor) ; à rejouer après `/aikido:setup`.

## Décision Papa appliquée

Aucun marqueur de test dans l'app. Harnais lit les textes visibles : « Confirmer l'arrêt », « Terminer la course », « Arrêt 1 », « Arrêt 2 ».

## Statut par ISC / contrat

| Item | Statut | Preuve | Commit |
|------|--------|--------|--------|
| Driver Semantics `galass.driver.stops=…` retiré | **FAIT** | `rg galass.driver lib/` → seulement commentaire retrait ; widget tests 5/5 | Driver `482a772` |
| Driver ValueKey `galass.driver.itinerary.*` retirés | **FAIT** | `_stopProgressKey` supprimé ; progression prouvée par gris+barré | Driver `482a772` |
| Tests unitaires réécrits (textes/styles) | **FAIT** | `flutter test` …stops_progress + itinerary_progress → **7/7 PASS** (3.44.8) | Driver `482a772` |
| Harnais MARK stop1/stop2/fin sur textes visibles | **FAIT** | `MARK_driver_stop1_done` = Arrêt1&Arrêt2&Terminer&Medina ; `stop2_done` = Arrêt1&Arrêt2&Terminer&Fann (**Destination retirée**) | emu `68af0c2` |
| Harnais sans `galass.driver` | **FAIT** (déjà avant) | `rg galass.driver` dans emu → 0 hit | emu `68af0c2` |
| `test_markers.py` aligné | **FAIT** | `python3 e2e/tests/test_markers.py` → **75/75** | emu `68af0c2` |

## Branches / PRs

| Repo | Branche | Base proposée | Tip |
|------|---------|---------------|-----|
| Galass_Driver | `cursor/driver-remove-test-markers-e410` | tip Destination golden `b069bf9` (MS + sheet 0.7) | `482a772` |
| galass-emu-actions-pub | `cursor/artemis-visible-markers-e410` | `cursor/artemis-f427-pusher-e410` @ `6f8dba0` | `68af0c2` |

Aucun push `main`. Aucun merge. Aucun déploiement.

## Code vérifié vs ISA cochée

- ISA Driver MS coche encore « Contrat marqueur à propager » / Semantics `galass.driver.stops` (Remaining ouvert) et ISC-F5-14 texte historique « contrat Semantics ». **Le code tip E1 ne monte plus ce Semantics** — si un ISC reste coché « Semantics présent », **c'est un écart code↔ISA** : à réconcilier via ISATool en E6 (pas maintenant).
- Harnais consommait déjà les textes visibles (pas le Semantics) : la suppression app aligne enfin le contrat Papa ; le Remaining « propager Semantics au harnais » est **obsolète** (remplacé par textes visibles).

## Ce que je n'ai pas pu prouver

| Preuve manquante | Comment l'obtenir |
|------------------|-------------------|
| Capture émulateur réelle stop1/stop2/fin sans Semantics | E4 Artemis Lane A avec tip Driver `482a772` + harnais `68af0c2` |
| Aikido SAST clean | Auth MCP Aikido / `/aikido:setup` puis rescan des 6 fichiers |
| Alignement ISA F5-14 / Remaining marqueur | ISATool en E6 après preuves Artemis |

## Questions Papa (signalées, non bloquantes)

1. Ordre de merge proposé : multistop d'abord, puis lot rebasé.
2. GO staging / migration / déploiement (ISC-21/24).
3. Merge du pin Flutter 3.44.8 dans `main` du harnais.

## STOP

E1 clos côté code+tests locaux. **Attente GO Papa pour E2** (planches frise/goldens).
