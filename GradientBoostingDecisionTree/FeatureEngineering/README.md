# Feature Engineering for Pharmacogenetics Analysis

This repository is dedicated to feature engineering tasks pertinent to the analysis of methotrexate-induced mucositis in cancer patients. The content spans various Jupyter notebooks and R scripts that cater to different facets of the analysis.

## Table of Contents

- [Description of Files](#description-of-files)
- [Feature Types](#feature-types)
- [PCA Generation and Visualization](#pca-generation-and-visualization)

## Description of Files

1. **`feature_pruned_subject_removed.ipynb`**: This notebook encompasses the genotyping features pruned to retain an \(r^2\) value of 0.8 or lower. Subjects with incomplete allele information for certain variants have been omitted.

2. **`feature_pruned_withNA.ipynb`**: In this notebook, all subjects are retained, even those with missing data. Feature pruning mirrors the approach in `feature_pruned_subject_removed.ipynb`.

## Feature Types

### Genetically Determined Ancestry PCs

Both `feature_pruned_subject_removed.ipynb` and `feature_pruned_withNA.ipynb` employ genetically determined ancestry PCs as features. These PCs are extrapolated from the renowned 1000 Genomes Project.

### ADMIXTURE-based Population Estimation

The notebook titled `feature_pruned_subject_removed_pop.ipynb` incorporates ADMIXTURE, a potent software tool tailored for maximum likelihood estimation of individual ancestries derived from multilocus SNP genotype datasets. Not only is ADMIXTURE expedient, surpassing tools like STRUCTURE in speed, but it also adheres to an identical statistical model. Delve deeper into ADMIXTURE's capabilities [here](https://dalexander.github.io/admixture/).

## PCA Generation and Visualization

The **PCA folder** within this repository hosts R scripts dedicated to generating PCAs that epitomize genetically determined ancestry. Additionally, visual representations of the initial four PCs can be gleaned from sample plots contained within. This in-depth PCA analysis serves as a foundational block for understanding genetic ancestry in the context of our study.

---

This should offer a comprehensive view, ensuring your GitHub README is both informative and well-structured.