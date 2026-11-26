# Antenly FR-04 — Max Vague 3 (L4+L5+L8) (2026-11-26)

Dépôt antenly, branche **close/fr04-v3-max** (copie tip Vague 3 vérifiée). ISA : `MEMORY/WORK/2026-11-02-fr-04-segmentation/ISA.md`.

Verify×3 Vague 3 déjà **PASS** :
- Forge `c2f169e` — « vérifie la Vague 3 (L4+L5+L8) — PASS »
- CR `f6c41ce` — « verdict PASS (123 tests, T4.1/T5.1/T8.1) »
- Silas `84104de` — « vérification Vague 3 L4+L5+L8 VERDICT PASS »

Périmètre : **Vague 3 seulement** (T4.1 min duration/résidus, T5.1 overlap, T8.1 emission FR-06). Pas Vague 4+ (L6/L7/L9), pas L10, pas gel seuils Papa.

Rôle Max : GO ou NO-GO sur la Vague 3. Lis les commits V3 + VERIFY si présents. N’écris pas de code produit. Écris `MAX-FR04-V3.md` à la racine : 1re ligne `VERDICT: PASS` ou `VERDICT: BLOCK`, puis raison courte. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`. Ne lis pas `evidence/`, `kuna_*.c`, `match_*.md`.
