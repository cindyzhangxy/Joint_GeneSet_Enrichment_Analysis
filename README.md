# Pharmacogenetics Analysis: Methotrexate-Induced Mucositis Risk

This repository contains code and workflows for a three-phase gene set enrichment analysis focusing on methotrexate-induced mucositis in cancer patients. Additionally, this repo contains scripts used for feature engineering, which are then utilized in an XGBoost model to aid in the analysis. We use publicly available datasets to identify biological pathways linked to adverse drug reactions.

**Note**: This repository does not contain patient data or identifiers to ensure confidentiality.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Contact](#contact)

## Overview

Our aim is to identify gene sets that are highly represented in patients who have experienced methotrexate-induced mucositis. This analysis consists of three parts, each covering different facets of gene set enrichment. Furthermore, the repository includes feature engineering scripts as well as scripts for running an XGBoost model.

## Installation

### Prerequisites

- Python 3.11.5 or later
- Required Python packages: `pandas`, `numpy`, `scikit-learn`, `seaborn`, `matplotlib`, `xgboost`

### Setup with pip

```bash
pip install pandas numpy scikit-learn seaborn matplotlib xgboost
```

### Setup with Anaconda

```bash
conda create --name myenv python=3.10.3 pandas numpy scikit-learn seaborn matplotlib xgboost
conda activate myenv
```

To quickly set up the `gbdt_feature` environment, you can also use the provided `gbdt_feature.yml` file by running `conda env create -f gbdt_feature.yml`.

## Usage

1. Clone the repository and navigate to its directory.
2. Run the desired script with Python. For example, to run the feature engineering script, use `python feature_engineering.py`.

Each script is thoroughly documented for your convenience. Though the data isn't provided, we guide you on how to acquire it from public sources.

## Contact

For any questions, please reach out to [czhang@cmmt.ubc.ca].
