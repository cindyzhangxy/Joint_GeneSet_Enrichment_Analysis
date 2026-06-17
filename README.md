[![Paper](https://ascpt.onlinelibrary.wiley.com/doi/abs/10.1002/cpt.70135)]
[![DOI]([https://doi.org/10.1002/cpt.70135])]
[![Data](https://img.shields.io/badge/Data-Restricted-lightgrey.svg)]

# Identifying Pharmacogenetics Variants in Methotrexate-Induced Mucositis Using Gene Set Analysis and Machine Learning 

## Overview

This repository accompanies the publication:

**Zhang XYC, Scott EN, Maagdenberg H, Man A, Li KH, Rassekh SR, Carleton BC, Ross CJD, Wasserman WW, Loucks CM.** *Pathway-Informed Machine Learning Identifies Genetic Predictors of High-Dose Methotrexate-Induced Mucositis in Pediatric Acute Lymphoblastic Leukemia*. **Clinical Pharmacology & Therapeutics**. 2026. 

The study investigated the genetic architecture of high-dose methotrexate-induced mucositis in pediatric acute lymphoblastic leukemia through pathway-informed feature engineering, gene set enrichment analysis, and machine learning. Biological pathways associated with mucositis susceptibility were identified and incorporated into predictive models to improve risk stratification.

This repository contains the code and computational workflows used for pathway curation, feature engineering, gene set analysis, and gradient-boosted decision tree modeling. The repository includes R scripts for genomic feature generation and Python scripts for machine learning analyses, pathway database integration, and annotation using Ensembl GRCh37 resources.

To protect patient privacy and comply with institutional ethics requirements, no patient-level genotype, phenotype, or clinical data are included in this repository. Publicly available resources and pathway databases were used where possible, and all code required to reproduce the computational analyses is provided.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
  - [Python Environment](#python-environment)
  - [R Environment](#r-environment)
- [Usage](#usage)
- [Contact](#contact)
- [Folders in this Repository](#folders-in-this-repository)

## Installation

### Prerequisites

#### Python Environment

- Python 3.10.3 or later
- Required Python packages: `pandas`, `numpy`, `scikit-learn`, `seaborn`, `matplotlib`, `xgboost`, `gseapy`, `openpyxl`

##### Setup with pip

```bash
pip install pandas numpy scikit-learn seaborn matplotlib xgboost gseapy openpyxl
```

##### Setup with Anaconda

```bash
conda create --name myenv python=3.10.3 pandas numpy scikit-learn seaborn matplotlib xgboost gseapy openpyxl
conda activate myenv
```
##### Set up with `gbdt_feature.yml` directly 
Alternatively, if you prefer a direct setup, utilize the provided gbdt_feature.yml to recreate the Conda environment seamlessly for the python scripts. 

#### R Environment

- Required R libraries: `tidyverse`, `data.table`, `stringr`

##### Setup with R

```R
- R 4.2.2 or later
- install.packages(c("tidyverse", "data.table", "stringr"))
```


### Usage

1. Clone the repository and navigate to its directory.
2. For feature engineering, run the desired R script. 
3. For running the gradient-boosted decision tree models and calling APIs, run the corresponding Python script. 

Each script is thoroughly documented for your convenience. Although the data isn't provided, we guide you on how to acquire it from public sources.

## Contact

For any questions, please reach out to [czhang@cmmt.ubc.ca].

## Folders in this Repository

- `GradientBoostedDecisionTree`: This folder contains both regular GBDT and XGBoost algorithms, designed to handle both preprocessed data without NA values and original data with missing values.

- `PathwayCuration`: This folder focuses on gathering information from Pathway databases by calling APIs complemented with expert review and literature review. 

- `JAGResults`: This folder contains the results of the Joint Association analysis. The tool can be available from [this link](https://ctg.cncr.nl/software/jag).

- 


## Citation

This repository accompanies the following publication. If you use this code, workflows, or derived resources in your research, please cite:

> Zhang XYC, Scott EN, Maagdenberg H, Man A, Li KH, Rassekh SR, Carleton BC, Ross CJD, Wasserman WW, Loucks CM. *Pathway-Informed Machine Learning Identifies Genetic Predictors of High-Dose Methotrexate-Induced Mucositis in Pediatric Acute Lymphoblastic Leukemia*. **Clinical Pharmacology & Therapeutics**. 2026. https://doi.org/10.1002/cpt.70135

### BibTeX

```bibtex
@article{zhang2026pathway,
  title={Pathway-Informed Machine Learning Identifies Genetic Predictors of High-Dose Methotrexate-Induced Mucositis in Pediatric Acute Lymphoblastic Leukemia},
  author={Zhang, Xiao Yu Cindy and Scott, Erika N and Maagdenberg, Hedy and Man, Alice and Li, Kathy H and Rassekh, S Rod and Carleton, Bruce C and Ross, Colin JD and Wasserman, Wyeth W and Loucks, Catrina M},
  journal={Clinical Pharmacology & Therapeutics},
  year={2026},
  doi={10.1002/cpt.70135}
}
```



