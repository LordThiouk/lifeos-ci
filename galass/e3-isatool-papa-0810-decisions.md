# ISATool — décisions Papa 08:10 (noter, ne pas coder)

Un job = **un chantier** (dispatcher séparément). Branche **canonique** du chantier. Compteurs = frontmatter de cette branche, jamais `main`.

## Décisions à noter (ISATool Decisions uniquement — aucun tick sans preuve tierce)

1. **Clé ISA** — correctif `_agent-run.yml` seed `ISA_STAMP_KEY` → agent_home : PR lifeos-ci #43 MERGED (`7da1004`). Ne jamais lire/afficher/régénérer la clé.
2. **Autosave wip** — désactivé sur jobs `e3-serena`/`e3-forge` (harnais seed `3d91625`) : un wip entre carry et Forge corrompait `fullrun-carry.json`.
3. **Goldens PR #33** — retirer stop1_actif / stop1_fait / tous_arrets_faits ; garder set main + `course_en_cours_simple` ; ajouter `f427_2_arrets`/`f427_3_arrets` depuis multistop **sans regen**. Si absents → STOP (Papa).
4. **Parent HOLD** — ISC-21…21.4 et ISC-22/22.1 restent HOLD / NON VALIDÉ tant que tip Driver n'a pas `ImageSource.camera` + preuve device/e2e.
5. **Rider lot ISC-85** — unit `rider_profile_camera_test` 5/5 vert (run `46123081429`) ; preuve appareil **absente** → ne pas inventer de tick device.
6. **Backend MS** — contrat `STOP_COMPLETED` + ISC-40 : test `test_isc39_wire_contract_channel_event_envelope` ; canal `private-rider-user-{id}` ; enveloppe `{chanelName,data,eventName,socket}` ; **émission inchangée** (run `46123923052`, tip `ef56625`).
7. **PHPUnit** — PR backend #18 **ne pas merger** ; PHPUnit produit = dépôt `galass-ci` (PR #25).
8. **Artemis** — GO Papa 2 lanes après forges poussés ; Flutter 3.44.8 ; ids > 900000 ; STOP si quota/émulateur dégradé.

## Par chantier (adapter le dépôt/branche du dispatch)

- Rider MS → `Galass_Rider` @ `feat/multistop-rider-close-2026-11-20` ; ISA `20261006-galass-rider-multistop`
- Rider lot → `Galass_Rider` @ `feat/lot-w2-rider` ; ISA lot rider enfant
- Driver lot → `Galass_Driver` @ `feat/lot-w2-driver` ; ISA `2026-11-22-galass-driver-lot-client`
- Driver MS → `Galass_Driver` @ `feat/multistop-e2e-2026-11-15`
- Parent lot → `Galass_backend` @ `fullrun/lot-client-w0` ; ISA `2026-11-22-galass-lot-client`
- Backend MS → `Galass_backend` @ `feat/multistop-e2e-2026-11-15` ; ISA `20261006-galass-regression-multistop`
- ISA emu → `galass-emu-actions-pub` @ `cursor/artemis-f427-pusher-e410`

ISATool seul. Commit docs(isa). Push. **STOP**. Pas de code produit.
