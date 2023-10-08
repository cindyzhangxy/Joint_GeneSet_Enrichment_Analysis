# Feature Engineering for Pharmacogenetics Analysis

This repository focuses on feature engineering for analyzing methotrexate-induced mucositis in cancer patients. It contains a mix of Jupyter notebooks, R scripts, and related folders catering to different aspects of the study.

## Table of Contents

- [File and Folder Descriptions](#file-and-folder-descriptions)
- [Feature Categories](#feature-categories)

## File and Folder Descriptions

### Files:

1. **`feature_pruned_subject_removed.ipynb`**: Utilizes the scikit-learn GBDT model. Features are pruned based on an \(r^2\) value of 0.8 or above, excluding subjects with incomplete allele information.
2. **`feature_pruned_withNA.ipynb`**: Implements XGboost to include all subjects, barring one due to missing radiation status. Feature pruning is consistent with the first notebook.

### Folder:

- **PCA Visualization**: This folder contains R scripts for generating PCAs representing genetically determined ancestry. It also offers visualizations of the first four PCs, providing insights into genetic ancestry relevant to this study.

## Feature Categories

### Genetically Determined Ancestry PCs

Both notebooks incorporate ancestry PCs derived from the renowned 1000 Genomes Project.

### Genetic Variants

As a proof of concept, we selected features for 259 genetic variants linked to six genes of interest identified in [gene-based gene set enrichment analysis](https://github.com/cindyzhangxy/Joint_GeneSet_Enrichment_Analysis/tree/master/JointAssocationAnalysisResultOnly): _LRP5_, _CSNK1A1_, and _PPARD_ in the WNT/β-Catenin signaling pathway and _PIK3R2_, _PRKCD_, and _AGT_ in the IL-6 signaling pathway. These genes were identified within the enriched gene sets for the HD IV-MTX treated group. The genotype of each variant was assigned a score based on allele presence: 

- 0: homozygous for the reference allele
- 1: heterozygous for the reference allele
- 2: homozygous for the variant allele

We utilized the Ensembl Variant Effect Predictor (VEP) GRCh37 to gather molecular features linked to each variant within these six genes. For variants in RNA transcript regions, our focus remained on canonical transcript variants, deemed most representative of each gene. The maximum Combined Annotation Dependence Depletion (CADD) phred scores for each gene in the HD IV-MTX treated group were collected as features. Our feature removal process followed these principles:

- Elimination of redundant or highly correlated features
- Removal of features with negligible predictive power or lacking biological relevance to mucositis from cancer treatment
- Exclusion of features with >50% missing data

To refine our analysis, we applied a Linkage Disequilibrium (LD) -based variant pruning using PLINK v1.9. This aimed to remove variants with a pairwise $\(R^2\)$ above 0.8, using a 50 SNP window and a 5 SNP step size. This LD-pruning ensures the retention of informative, independent variants.

### Clinical Features

Included features are sex, radiation status, age at IV-MTX initiation, and the first four PCs from a PCA that combines our study's populations with the 1000 Genomes Project reference populations. This captures genetically determined ancestry unique to our study's population. These features were selected based on their potential significance in forecasting MTX-induced mucositis outcome, detailed further in section 2.2.
