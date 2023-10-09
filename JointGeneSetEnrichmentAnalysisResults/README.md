# Joint Gene Set Enrichment Analysis Repository

This repository hosts files related to the joint gene set enrichment analysis. Analysis was segmented based on varying MTX dosages. The enrichment analysis was conducted using [JAG](https://ctg.cncr.nl/software/jag), which utilizes Python v2.6.

Documents indispensable for the analysis, such as the `.bim`, `.bed`, and `.fam` files in PLINK format, were produced using the BC Platform as per the CPNDS ethics agreement. Additionally, covariates employed in the initial GWAS are of note. To preserve patient confidentiality, these two files are absent from this GitHub repository.

## Cohort Categorization

The cohort was trifurcated based on MTX dosage:

1. **HD IV-MTX group**: Patients who received > $1000 mg/m^2$ IV-MTX as part of their treatment (n = 278).
2. **LD IV-MTX group**: Patients who received < $1000 mg/m^2$ IV-MTX as part of their regimen (n = 314).
3. **Full cohort**: All subjects, tallying 497, that were administered either HD and/or LD IV-MTX.

## Repository Structure

- `combined_dosage/`: Contains files for the full cohort.
- `high_dose/`: Files pertinent to the HD IV-MTX group. This folder also houses a `gene_based/` sub-directory which includes jAG output for gene-based gene set enrichment analysis focusing on two significantly enriched pathways: IL6 (il6) and Wnt/beta-catenin (wnt).
- `low_dose/`: Dedicated to the LD IV-MTX group's files.

### Content in Each Dosage Category Folder

Each dosage category folder is structured with:
- `jag.merged.P1.empp`: Holds the results of the self-contained test.
- `jag.merged.P1.perm`: Contains test statistics for the permuted data.
