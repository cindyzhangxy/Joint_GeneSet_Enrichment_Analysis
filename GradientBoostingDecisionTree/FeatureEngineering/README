# Feature Engineering for Pharmacogenetics Analysis

This folder contains various Jupyter notebooks focused on feature engineering tasks for the analysis of methotrexate-induced mucositis in cancer patients.

## Table of Contents

- [Description of Files](#description-of-files)
- [Feature Types](#feature-types)

## Description of Files

1. **`feature_pruned_subject_removed.ipynb`**: This notebook contains the genotyping features that are pruned to have an \(r^2\) value of 0.8 or lower. Subjects with incomplete allele information on some variants have been removed.

2. **`feature_pruned_withNA.ipynb`**: This notebook contains all subjects, irrespective of the data missingness. Features are pruned similarly to `feature_pruned_subject_removed.ipynb`.

3. **`feature_pruned_subject_removed_pop.ipynb`**: Unlike the first two notebooks, this one does not use Principal Components (PCs) as features. Instead, it uses individual population estimations based on ADMIXTURE.

## Feature Types

### Genetically Determined Ancestry PCs

The first two notebooks, `feature_pruned_subject_removed.ipynb` and `feature_pruned_withNA.ipynb`, use genetically determined ancestry PCs as features. These PCs are referenced from the 1000 Genomes Project.

### ADMIXTURE-based Population Estimation

The `feature_pruned_subject_removed_pop.ipynb` notebook utilizes ADMIXTURE as a software tool for maximum likelihood estimation of individual ancestries from multilocus SNP genotype datasets. It is much faster than other methods like STRUCTURE but uses the same statistical model. Learn more about ADMIXTURE [here](https://dalexander.github.io/admixture/).
