# GBDT Model for Risk Statification for Methotrexate-Induced Mucositis 

This repository delves into feature engineering for the analysis of methotrexate-induced mucositis in cancer patients. The content spans Jupyter notebooks, R scripts, and assorted folders, each addressing different dimensions of the investigation.

## Table of Contents
- [File and Folder Descriptions](#file-and-folder-descriptions)
- [Feature Categories](#feature-categories)
- [GBDT Models](#gbdt-models)

## File and Folder Descriptions

### Files:
- **`feature_pruned_subject_removed.ipynb`**: Employs the scikit-learn GBDT model. Prunes features with an $\( R^2 \)$ value above 0.8 and omits subjects missing any allele data.
- **`feature_pruned_withNA.ipynb`**: Utilizes XGBoost, incorporating all subjects except one with absent radiation status. Adheres to feature pruning as in the prior notebook.

### Folder:
- **PCA Visualization**: Houses R scripts tasked with crafting PCAs that epitomize genetically-determined ancestry. The first four PCs are visualized, elucidating the genetic ancestry germane to this research.

## Feature Categories

### Genetically Determined Ancestry PCs
Both notebooks incorporate ancestry PCs extracted from the esteemed 1000 Genomes Project.

### Genetic Variants
Building on a proof of concept, we earmarked features tied to 259 genetic variants associated with six pivotal genes: LRP5, CSNK1A1, PPARD (within the WNT/β-Catenin signaling pathway), and PIK3R2, PRKCD, AGT (within the IL-6 signaling pathway). These were discerned from enriched gene sets for the HD IV-MTX treated cohort. Each variant's genotype was classified via allele presence:

- 0: Homozygous for the reference allele
- 1: Heterozygous for the reference allele
- 2: Homozygous for the variant allele

The Ensembl Variant Effect Predictor (VEP) GRCh37 was employed to pinpoint molecular attributes tied to every variant within the aforementioned genes. Emphasis was placed on canonical transcript variants within RNA transcript regions, given their representative nature for each gene. We harnessed the maximum Combined Annotation Dependence Depletion (CADD) phred scores of each gene for the HD IV-MTX group as features. Feature elimination was guided by:

- Removing redundant or intensively correlated features.
- Omitting features with scant predictive utility or devoid of biological pertinence to mucositis stemming from cancer treatment.
- Excluding features with over 50% data missing.

An LD-based variant pruning via PLINK v1.9 was executed to discard variants with a pairwise $\( R^2 \)$ above 0.8, utilizing a 50 SNP window and a 5 SNP step.

### Clinical Features
We incorporated features such as sex, radiation status, age upon IV-MTX commencement, and the initial four PCs from a PCA amalgamating our cohort with reference sets from the 1000 Genomes Project. This collates genetically-steered ancestry inherent to our study group. These features' selection stemmed from their anticipated impact in predicting MTX-induced mucositis, elaborated in section 2.2.

## GBDT Models

The **GBDT Models** folder contains:

- **`GBDT_binary_subject_removed`**: A Jupyter notebook housing basic GBDT models from scikit-learn, tailored for datasets where subjects with any missing data points were excised.
  
- **`XGboost_withNA_PC`**: This encompasses the XGBoost model adept at harnessing all data, inclusive of those with missing values.

