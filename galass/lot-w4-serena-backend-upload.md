# Lot-client W4 — Serena carry Backend upload (ISC-21.4)

Dépôt `Galass_backend`, branche `fullrun/lot-client-w0`. ISA : `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`.

**But :** carry signé FullRun pour que forge `lot-w4-backend-upload` passe le préflight `start_step=build` → porte `completeness_pre`.

## Obligatoire (sinon le forge échoue code=2)

1. Le fichier `MEMORY/WORK/2026-11-22-galass-lot-client/fullrun-carry.json` est **périmé** (HEAD Nov 22, **sans étape 3 serena**). Un paragraphe Decisions seul **ne suffit pas**.
2. Utiliser `FullRunCarry.ts` : `proveStart` / `exportCarry` pour les étapes **1 completeness_pre**, **2 vera**, **3 serena**, ancré sur le **HEAD courant** après l'append ISA.
3. Committer **ISA.md + fullrun-carry.json** ensemble (auteur Papa Diop). Vérifier que `payload.head` = SHA du commit d'ancrage et que `steps["3"].status` = `pass`.
4. Contrôle local : `bun FullRunPreflight.ts … start_step=build` doit ouvrir la porte (code 0), pas conseiller `completeness_pre`.

## Périmètre plan

ISC-21.4 partie backend seulement (limite taille/mime upload photo, PHPUnit 200/422). Ne pas coder. Ne pas cocher. ISATool append Decisions OK en plus du carry. Pas `.fullrun`. Pas secrets PSP. Wave/OM intacts.

Référence Driver W4 : Decisions « Carry signé (étapes 1 completeness_pre, 2 vera, 3 serena) » + `fullrun-carry.json` mis à jour dans le même commit.
