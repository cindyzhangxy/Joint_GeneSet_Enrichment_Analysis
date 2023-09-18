# Pharmacogenetics Analysis: Methotrexate-Induced Mucositis Risk

This repository contains code and workflows for a three-phase gene set enrichment analysis focusing on methotrexate-induced mucositis in cancer patients. Specifically, the repository includes R scripts for feature engineering and Python scripts for running the XGBoost models and calling APIs from pathway databases and Ensembl GRCh37. Publicly available datasets were used to identify biological pathways linked to adverse drug reactions.

**Note**: This repository does not contain patient data or identifiers to ensure confidentiality.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
  - [Python Environment](#python-environment)
  - [R Environment](#r-environment)
- [Usage](#usage)
- [Contact](#contact)

## Overview

Our aim is to identify gene sets that are highly represented in patients who have experienced methotrexate-induced mucositis. The analysis consists of multiple parts, including gene set enrichment, feature engineering using R, and machine learning models using Python.

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

To quickly set up the `gbdt_feature` Python environment, you can also use the provided `gbdt_feature.yml` file by running `conda env create -f gbdt_feature.yml`.

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
