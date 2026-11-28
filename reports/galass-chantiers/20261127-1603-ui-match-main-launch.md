# Correction Papa — UI course = main (bandeau non voulu)

Date: 2026-11-27 16:03 Africa/Dakar

## Décision
La ligne d’avancement (« En route vers… », « x/N arrêt(s) terminé(s) ») **n’est pas voulue**.  
Écran course en cours **et** terminée = **identique à main** (ISA).  
Goldens main restent la référence — **aucune regen / nouvelle référence**.

## Actions
1. Annulé F4-25 mal cadré [46028637215](https://github.com/LordThiouk/lifeos-ci/actions/runs/46028637215) (+ golden-compare doublon 46028912828).
2. Relance mini `rider-f4-ui-match-main` — [46030222080](https://github.com/LordThiouk/lifeos-ci/actions/runs/46030222080) :
   - retire `stopsProgressText` + `currentLegBanner` (tous états course)
   - restaure tuile notes (**F4-25**)
   - cible : 5 goldens course **≈ 0 %** sans `--update-goldens`

## Suite (inchangée)
F4-26 → F4-27 → Artemis diagnostic.  
Après PASS de ce mini : **refaire les 5 planches** + % dans le rapport Markdown (chemins relatifs).
