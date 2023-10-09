# GBDT Model for Risk Stratification for Methotrexate-Induced Mucositis 

This repository delves into feature engineering and GBDT model for the risk classification for pediatric ALL patients who developed mucositis secondary to high-dose IV Methotrexate (> $1000mg/m^2$). The content spans Jupyter notebooks, R scripts, and various folders, each addressing different dimensions of the investigation.

## Table of Contents
1. [File and Folder Descriptions](#file-and-folder-descriptions)
2. [Feature Categories](#feature-categories)
3. [GBDT Models](#gbdt-models)
4. [Directory Tree](#Directory_Tree)

## File and Folder Descriptions

### `FeatureEngineering` Folder:
#### Files:
- `feature_pruned_subject_removed.ipynb`: Employs the scikit-learn GBDT model. Prunes features with an \( R^2 \) value above 0.8 and omits subjects missing any allele data.
- `feature_pruned_withNA.ipynb`: Utilizes XGBoost, incorporating all subjects except one with absent radiation status. Adheres to feature pruning as in the prior notebook.

#### Sub-Folder:
- `PCA Visualization`: Contains R scripts for crafting PCAs that represent genetically-determined ancestry. The first four PCs are visualized, offering insights into the genetic ancestry relevant to this research.

### `GBDT Models` Folder:
#### Files:
- `GBDT_binary_subject_removed.ipynb`: Contains basic GBDT models from scikit-learn, tailored for datasets omitting subjects with any missing data points.
- `XGboost_withNA_PC.ipynb`: Showcases the XGBoost model, capable of handling datasets with missing values.

## Feature Categories

### Genetically Determined Ancestry PCs
Both notebooks in the `FeatureEngineering` folder utilize ancestry PCs from the renowned 1000 Genomes Project.

### Genetic Variants
Based on a proof of concept, features linked to 259 genetic variants from six crucial genes were identified: LRP5, CSNK1A1, PPARD (within the WNT/β-Catenin signaling pathway), and PIK3R2, PRKCD, AGT (within the IL-6 signaling pathway). These were discerned from enriched gene sets for the HD IV-MTX treated cohort. Variant genotypes are classified based on allele presence:
- 0: Homozygous for the reference allele
- 1: Heterozygous for the reference allele
- 2: Homozygous for the variant allele

The Ensembl Variant Effect Predictor (VEP) GRCh37 was used to highlight molecular attributes tied to every variant within the mentioned genes. Canonical transcript variants within RNA transcript regions were focused upon. The maximum Combined Annotation Dependence Depletion (CADD) phred scores of each gene for the HD IV-MTX group were utilized as features. The pruning process was guided by specific criteria, including removing redundant features and omitting features with limited predictive utility.

### Clinical Features
Clinical features like sex, radiation status, age at IV-MTX commencement, and the first four PCs from a PCA amalgamating our cohort with reference sets from the 1000 Genomes Project were incorporated.

## Directory_Tree
.
├── FeatureEngineering
│ ├── feature_pruned_subject_removed.ipynb
│ ├── feature_pruned_withNA.ipynb
│ └── PCA Visualization
│ 	├── PC1vsPC2.png
│ 	├── PC2vsPC3.png
│ 	├── PC3vsPC4.png
│ 	└── pca_Rscript.r
└── GBDT Models
│ ├── GBDT_binary_subject_removed.ipynb
│ ├──XGboost_withNA_PC.ipynb