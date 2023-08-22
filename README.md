# Gene Set Enrichment Analysis for Pharmacogenetics Predictors Identification and Adverse Drug Reaction Risk Modeling 

This repository features code and data related to a three-part, joint-association gene set enrichment analysis in pharmacogenomics. The central research query is: Are there specific biological pathways, identified through a structured literature review, that are more prevalent in patients who experienced methotrexate-induced mucositis during their cancer treatment? It's important to note that this repository exclusively includes analyses based on publicly available datasets. To uphold patient confidentiality, any identifiers or direct patient data have been omitted, retaining only the analyses.

## Overview

This repository presents the results of a comprehensive gene set enrichment analysis for pharmacogenomics. The analysis involves three distinct parts, each focusing on different aspects of gene set enrichment. The aim of this research is to identify enriched gene sets associated with specific drug responses or therapeutic outcomes.

## Data

The data used in this analysis are publicly available datasets that have been carefully curated and processed for this specific research. Proprietary genomics information, drug response data, and clinical outcomes were masked to protect confidentiality.  

## Code

The code provided in this repository encompasses the necessary scripts and workflows to reproduce the gene set enrichment analysis. These scripts have been thoroughly documented to assist users in understanding the methodology and implementing the analysis on their own datasets if desired.

## Requirements and Installation

To run the scripts in this repository, you will need to have Python 3.10.3 or later installed along with the following packages:

- pandas
- numpy
- scikit-learn (sklearn)
- seaborn
- matplotlib

You can install these packages using the following commands:

### Using pip

```bash
pip install pandas numpy scikit-learn seaborn matplotlib
```

### Using conda

If you are using Anaconda, you can create an environment with the required packages by running:

```bash
conda create --name myenv python=3.10.3 pandas numpy scikit-learn seaborn matplotlib
conda activate myenv
```

## Running the Scripts

After installing the necessary packages, you can run the scripts in this repository. Make sure to navigate to the directory containing the scripts and then execute the desired script using Python.

## How to Use

To utilize the code and replicate the analysis, follow the instructions provided in the respective directories. The code is written in [python or R], and detailed explanations are provided within the code files. Any additional dependencies required for running the code are specified in the documentation.

Please note that the data used in this analysis is not included in this repository due to confidentiality reasons. However, instructions on how to obtain the data from publicly available sources are provided, ensuring transparency. 

## Contact

If you have any questions or inquiries regarding this repository, please contact [czhang@cmmt.ubc.ca]. I would be happy to assist you.
