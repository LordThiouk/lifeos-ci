# Rapport F4-27 + Source de vérité — 2026-11-27 20:15 Africa/Dakar

## Source de vérité (tableau d'ouverture)

| ISA | Branche canonique | Tip SHA | PR → main | Compteurs | Secondaires (action) |
|---|---|---|---|---|---|
| Rider MS | `feat/multistop-rider-close-2026-11-20` | `ea4156b` | [#24](https://github.com/LordThiouk/Galass_Rider/pull/24) | **30/39** | f4-27 **fusionné** ; #25/#26/#27 + f4-27 **à fermer** (OK Papa) |
| Driver lot | `feat/lot-w2-driver` | `8d6da37` | [#12](https://github.com/LordThiouk/Galass_Driver/pull/12) | **19/30** | #13 **fusionné** → **à fermer** (OK Papa) ; verify #5–#10 **à fermer** |
| Parent lot | `fullrun/lot-client-w0` | `db7f0339` | [#10](https://github.com/LordThiouk/Galass_backend/pull/10) | **41/64** | #16 **fusionné** → **à fermer** (OK Papa) ; #13–#15 CI (OK Papa) |
| Backend MS | `feat/multistop-e2e-2026-11-15` | tip MS | [#12](https://github.com/LordThiouk/Galass_backend/pull/12) | 95/125 | secondaires CI hors MS |

Aucune branche/PR fermée sans OK Papa. Merge → tip canonique uniquement (pas de push main).

---

## 1. F4-27 Rider — liste Arrêt N

| Critère | Statut | Preuve |
|---|---|---|
| Liste empilée Arrêt 1…N (design main) | FAIT | `RideItineraryTimeline` + goldens `f427_2/3_arrets` |
| Pas de bandeau x/N / En route / message | FAIT | contract anti-bandeaux + F4-26 retiré |
| 1 arrêt = main, golden **0 %** | FAIT | `course_en_cours_simple` PASS 0 % |
| Goldens gelés jamais regen | FAIT | stop1_* / tous_arrets skippés ; PNG inchangés |
| Nouveaux goldens 2/3 arrêts | FAIT | `course_en_cours_f427_{2,3}_arrets.png` (Flutter 3.44.8) |

### Planches / captures

| Cas | Fichier |
|---|---|
| 1 arrêt board 0 % | `preuves/f4/course_en_cours_simple_board_f427_0pct.png` |
| 2 arrêts (capture golden) | `preuves/f4/course_en_cours_f427_2_arrets.png` |
| 3 arrêts (capture golden) | `preuves/f4/course_en_cours_f427_3_arrets.png` |

Tests Flutter 3.44.8 : goldens + contract → **+11 ~3 All other tests passed**.

---

## 2. ISA (ISATool uniquement)

| ISA | Notes Papa 27/11 |
|---|---|
| Rider MS | F4-27 = Arrêt N design main ; F4-26 retiré ; bandeaux retirés ; SoT |
| Driver lot | ISC-10 retiré ; CallKit 30 s ; SoT |
| Parent lot | ISC-23/23.1 = existant [x] ; compteurs sync ; SoT |
| Backend MS | SoT ajoutée |

---

## 3. Merge tip — FAIT (pas de push main)

| Secondaire | → Canonique | Tip après merge |
|---|---|---|
| `cursor/f4-27-arret-n-e410` | `feat/multistop-rider-close-2026-11-20` | `ea4156b` |
| `cursor/isc10-revert-separate-kyc-e410` | `feat/lot-w2-driver` | `8d6da37` |
| `cursor/lot-parent-isa-sync-1922-e410` | `fullrun/lot-client-w0` | `db7f0339` |

**Verify ×3 Rider tip** lancé 20:21 Africa/Dakar (chain=false) :
| Agent | Run |
|---|---|
| Forge | https://github.com/LordThiouk/lifeos-ci/actions/runs/46063079202 |
| Silas | https://github.com/LordThiouk/lifeos-ci/actions/runs/46063079195 |
| Code review | https://github.com/LordThiouk/lifeos-ci/actions/runs/46063079240 |

Max + **OK merge main** : seulement après 3× PASS — pas encore demandé.

---

## À fermer (liste seule — pas d'action)

| Repo | PR | Motif |
|---|---|---|
| Rider | #25 | pin 3.50.1 interdit |
| Rider | #26 | F4-26 revert obsolète post f4-27 |
| Rider | #27 | bandeaux repris dans f4-27 |
| Rider | #5, #7–#20, #23 | anciennes / verify |
| Driver | #5–#10 | verify post-OK |
| Backend | #13–#15 | CI hors lot (décision Papa) |
