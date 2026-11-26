# Antenly fr-04 — reporter les décisions déjà prises, mini workflow (Papa 2026-11-26 03:50 Dakar)

Dépôt antenly, branche isa/fr-04-vera-2026-11-26 (tête 0aeced5). ISA : dossier MEMORY/WORK/2026-11-02-fr-04-segmentation/.
Source de vérité : page d'audit (docs/audit-coverage-2026-11-10.md) > docs/PRD.md > ISA ; aussi les décisions datées de Papa dans les ISA annotation (MEMORY/WORK/2026-11-02-annotation-tool/) et language-identification.
Vera a listé 8 « Décision Papa attendue » (ISC-2 bien classé, ISC-4 strate wolof, ISC-5 appariement frontières, ISC-8 résiduels autre/silence, ISC-6 portage FR-06, ISC-3/ISC-11 support minimal, ISC-9 forme du gel, périmètre Aditi). Pour chacune : cherche si la page, le PRD ou une décision Papa datée la tranche déjà. Si oui, via ISATool.ts, remplace l'entrée par « Décision Papa reportée — <choix> (source fichier:ligne) » et aligne l'ISC. Si non, laisse l'entrée telle quelle.
Écris en fin de Decisions une ligne « Restent à trancher : … » avec la liste exacte. Vérifie que la fin de l'ISA n'est pas tronquée.
AUCUN code. Pas d'étape suivante. Petits commits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun. Aucune URL de flux, IP ou clé dans les docs.
