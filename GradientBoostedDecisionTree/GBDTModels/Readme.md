### 🔍 XGBoost Model Notes

- **Missing Values**: For each split, XGBoost determines whether directing missing values left or right yields higher gain. The best direction is learned automatically at each node.
- **Class Imbalance**: The `scale_pos_weight` hyperparameter is used to give more importance to the case class. It was set based on the negative-to-positive sample ratio.
- **Regularization**: L1 (`alpha`) and L2 (`lambda`) regularization terms were tuned to mitigate overfitting and improve generalization, offering advantages over basic GBDT implementations.
