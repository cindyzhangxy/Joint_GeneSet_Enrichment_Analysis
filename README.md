# Identifying Pharmacogenetics Variants in Methotrexate-Induced Mucositis Using Gene Set Analysis and Machine Learning 

## Overview

The primary objective of this project is twofold: 

1. To identify gene sets and individual genes that exhibit a strong association with patients who experience methotrexate-induced mucositis.
  
2. To leverage the insights gained from these gene sets to develop a machine learning algorithm aimed at predicting patient susceptibility to mucositis.

By coupling rigorous gene set enrichment analysis with machine learning techniques, the aim is to create a predictive model that can efficiently forecast the risk of methotrexate-induced mucositis in cancer patients.

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

- Python 3.10.3 or later
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
