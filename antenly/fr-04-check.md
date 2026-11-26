# Antenly fr-04 — vérification ISA face à la page, mini workflow (Papa 2026-11-26 04:21 Dakar)

Dépôt antenly, branche isa/fr-04-vera-2026-11-26 (tête efca064, l'étape précédente a fini sur quota). ISA : dossier MEMORY/WORK/2026-11-02-fr-04-segmentation/.
Source de vérité : page d'audit (docs/audit-coverage-2026-11-10.md) > docs/PRD.md > ISA ; décisions Papa datées dans les ISA annotation et language-identification.
Via ISATool.ts uniquement : vérifie ligne par ligne que chaque ISC est conforme à la page et au PRD, et que chaque « Décision Papa attendue » encore présente n'est vraiment tranchée nulle part (sinon reporte-la avec sa source fichier:ligne). Vérifie que la fin de l'ISA n'est pas tronquée. Régénère COMPLETENESS. Termine Decisions par une ligne « Restent à trancher : … » (liste exacte, ou « aucun »).
AUCUN code. Pas d'étape suivante. Petits commits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun. Aucune URL de flux, IP ou clé dans les docs.
