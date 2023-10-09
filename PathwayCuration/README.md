Based on your description, here's a README.md for your GitHub repository named `PathwayCuration`:

---

# PathwayCuration

This repository is dedicated to the curation and reconciliation of various gene sets relevant to pathway analyses. The content is segmented into specialized folders, each containing a specific set of data or code.

## 📂 Directory Structure

- `data/`: Contains curated gene sets from MSigDB, including:
  - c2: Curated gene sets from online pathway databases, publications in PubMed, and knowledge of domain experts. [Source](https://www.gsea-msigdb.org/gsea/msigdb/human/collections.jsp#C2)
  - c5: Ontology gene sets consisting of genes annotated by the same ontology term. [Source](https://www.gsea-msigdb.org/gsea/msigdb/human/collections.jsp#C5)
  
- `pk_pd_list/`: Contains a list of curated genes related to MTX pharmacokinetics and pharmacodynamics. This list is sourced from both [PharmGKB](https://www.pharmgkb.org/chemical/PA450428/pathway) and a structured literature review.

- `Enrichr/`: Contains the most updated Enrichr libraries at the time of our analysis.

- Notebooks:
  - `sonis_14_pathways.ipynb`: Retrieves gene sets for the 14 pathobiological pathways from the study of [Sonis et al. 2006](https://pubmed.ncbi.nlm.nih.gov/16920386/).
  - `stringdb_candidate_genes.ipynb`: Calls the StringDB API to curate gene sets seeded from candidate genes.
  - `Pk_pd_genes.ipynb`: Curates PK,PD related gene sets from PharmGKB.
  - `gene_set_reconciliation.ipynb`: Reconciles all gene sets to remove redundancy.

## 🚀 Getting Started

1. Clone the repository:
   ```sh
   git clone https://github.com/YOUR_USERNAME/PathwayCuration.git
   cd PathwayCuration
   ```

2. Install required libraries (if any) and make sure you have Jupyter Notebook or Jupyter Lab installed to run the notebooks.

3. Explore the directories to understand the curated data and execute the notebooks for detailed analysis.

## 🤝 Contributing

If you have suggestions or improvements, please open an issue or submit a pull request. Your feedback is always welcome!

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Note: 
- Please replace `YOUR_USERNAME` with your actual GitHub username in the `git clone` command.
- Modify or add additional instructions/details as necessary.
