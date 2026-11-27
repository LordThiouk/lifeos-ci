# Artemis figé d989ed1e + bisect UI course

Date: 2026-11-27 15:48 Africa/Dakar  
Demande Papa: relance E2E rider figé 28/30 + bisect post-d989ed1e (sans regen goldens).

## 1. Relance Artemis — rider figé `d989ed1e`

| Champ | Valeur |
|---|---|
| Run | https://github.com/LordThiouk/galass-emu-actions-pub/actions/runs/46027600691 |
| Harnais | `cursor/artemis-ms-close-b7-ids-e410` @ `b073d55` |
| `rider_ref` | `d989ed1e3f8532dd297418ca3c85d2da2de771d8` (SHA 28/30 Close-7) |
| `driver_ref` | `feat/multistop-e2e-2026-11-15` |
| Staging | secret `GALASS_STAGING_URL` → déploy `774656a2` (garde inchangée) |
| Ids | hardcodés workflow `900106` / `900023` |
| Goldens | **aucune régénération** |

Pourquoi ce SHA débloque l’E2E: à `d989ed1e` les tests contrat F4-25/26/27 et les PNG `course_en_cours_*` **n’existent pas encore** (ajoutés après, porte goldens-gate). Le step unitaires tip ne peut donc plus bloquer avant device. Verdict offre / assign / geo&lt;500 / stops Driver = **en cours** sur ce run.

## 2. Bisect Rider post-`d989ed1e` (F4-25/26/27 + goldens)

### Constat clé

```
git diff --stat d989ed1e..tip -- lib/   →  VIDE (0 fichier)
```

**Aucun commit après `d989ed1e` ne modifie l’écran de course.** L’UI tip ≡ UI 28/30.

### Commits après `d989ed1e` qui rendent le rouge (tests/PNG seulement)

| Commit | Rôle |
|---|---|
| `c866ac2` `wip(autosave): arbre de travail` | **1er commit « rouge »** — ajoute `course_en_cours_contract_test.dart` + harness goldens (F4-25/26/27) |
| `21b9de4` `test(rider): ajoute les 10 PNG goldens officiels (main 7984da7)` | importe les PNG référence **depuis main** (dont `course_en_cours_*`) |
| `5d16df2` | README / ISA — classifie le rouge (pas de code UI) |

### Lecture (classification Papa)

Source SSoT: `test/goldens/rider/README.md` (porte F11) :

| Critère | main | branche MS-close | Verdict |
|---|---|---|---|
| **ISC-F4-25** tuile notes RUNNING | PASS | FAIL | **Régression MS-close vs main** — documentée à restaurer (F11). Pas un accident post-d989. |
| **ISC-F4-26** bouton message | FAIL | FAIL | **Défaut préexistant** (aussi sur main), figé par le golden. |
| **ISC-F4-27** liste arrêts | FAIL | FAIL | **Défaut préexistant** (`rideItineraryUsesActiveLegOnly` en RUNNING). |
| Goldens 8–27 % | — | FAIL pixel | **Écart UI MS-close vs PNG main** — **relance only, jamais regen**. |

### Réponse à « voulu ou régression à corriger ? »

- **Pas de régression introduite après `d989ed1e`.** Le tip Artemis 460259 a échoué parce que la porte goldens/contrat a été **ajoutée** après le 28/30, contre une UI MS-close déjà divergente de `main`.
- **F4-25** = régression **voulue-à-restaurer** (track F11 / anti-régression UI) — **à valider / corriger côté UI**, pas en régénérant les PNG.
- **F4-26 / F4-27** = dettes préexistantes aussi sur `main` ; les corriger **rougira** la porte tant qu’une acceptation planche n’est pas faite (README).
- **5 goldens course** = bruit **non** ; signal réel d’écart vs référence main. **Ne pas régénérer.**

## 3. Suite

- Attendre verdict device run **46027600691** (offre / assign / geo&lt;500 / stops).
- Ne pas toucher tip Rider ni goldens sans OK Papa.
- Mini-0 ISC-10 / rollup caméra-OTP : pipelines séparés (inchangé).
