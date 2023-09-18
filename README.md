# Pharmacogenetics Analysis: Methotrexate-Induced Mucositis Risk

## Overview

The primary objective of this project is twofold: 

1. To identify gene sets and individual genes that exhibit a strong association with patients who experience methotrexate-induced mucositis.
  
2. To leverage the insights gained from these gene sets to develop a machine learning algorithm aimed at predicting patient susceptibility to mucositis.

By coupling rigorous gene set enrichment analysis with machine learning techniques, our aim is to create a predictive model that can efficiently forecast the risk of methotrexate-induced mucositis in cancer patients.

This repository contains code and workflows for a comprehensive gene set enrichment analysis, along with machine-learning models focusing on methotrexate-induced mucositis in cancer patients. Specifically, the repository includes R scripts for feature engineering and Python scripts for running the XGBoost models and calling APIs from pathway databases and Ensembl GRCh37. Publicly available datasets were used to identify biological pathways linked to adverse drug reactions.

**Note**: This repository does not contain patient data or identifiers to ensure confidentiality.

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

- Python 3.11.5 or later
- Required Python packages: `pandas`, `numpy`, `scikit-learn`, `seaborn`, `matplotlib`, `xgboost`

##### Setup with pip

```bash
pip install pandas numpy scikit-learn seaborn matplotlib xgboost
```

##### Setup with Anaconda

```bash
conda create --name myenv python=3.10.3 pandas numpy scikit-learn seaborn matplotlib xgboost
conda activate myenv
```

#### R Environment

- Required R libraries: `tidyverse`, `data.table`, `stringr`

##### Setup with R

```R
install.packages(c("tidyverse", "data.table", "stringr"))
```

### Usage

1. Clone the repository and navigate to its directory.
2. For feature engineering, run the desired R script. For example, use `Rscript feature_engineering.R`.
3. For running XGBoost models and calling APIs, run the corresponding Python script. For example, use `python xgboost_model.py`.

Each script is thoroughly documented for your convenience. Although the data isn't provided, we guide you on how to acquire it from public sources.

## Contact

For any questions, please reach out to [czhang@cmmt.ubc.ca].

## Folders in this Repository

- `GradientBoostingDecisionTree`: This folder contains both regular GBDT and XGBoost algorithms, designed to handle both preprocessed data without NA values and original data with missing values.

- `PathwayCuration`: This folder focuses on gathering information from Pathway databases by calling APIs complemented with expert review and literature review. 

- `JointAssociationAnalysisResultOnly`: This folder contains the results of the Joint Association analysis. The tool can be available from [this link](https://ctg.cncr.nl/software/jag).
