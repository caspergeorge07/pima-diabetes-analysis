Pima Indians Diabetes Dataset Analysis
Overview
This project analyzes the Pima Indians Diabetes Dataset using statistical techniques and machine learning methods to extract insights and patterns. The analysis includes Principal Component Analysis (PCA), Factor Analysis (FA), Cluster Analysis, and Linear Regression Models to explore the relationships among variables and predict diabetes risk.

Objectives
The key goals of this project include:

Dimensionality Reduction: Using PCA to identify the most influential variables and reduce complexity.
Factor Identification: Employing FA to extract latent factors driving diabetes risk.
Data Grouping: Performing Cluster Analysis to segment the dataset based on variable similarities.
Predictive Modeling: Building linear regression models to predict the Diabetes Pedigree Function (DPF).
Technologies Used
Programming Language: R
Libraries:
tidyverse (Data wrangling and cleaning)
ggplot2 (Data visualization)
psych (Factor Analysis)
factoextra (PCA and clustering)
cluster (Cluster Analysis)
GGally (Correlation matrix plots)
Tools: RStudio
Analysis Breakdown
1. Principal Component Analysis (PCA)
Objective: Identify the principal components that explain the maximum variance in the dataset.
Key Outputs:
Scree Plot: Visualizes the percentage of variance explained by each component.
Biplots: Show relationships between variables and samples in reduced dimensions.
Loadings Plot: Displays the contribution of each variable to the principal components.


2. Factor Analysis (FA)
Objective: Extract latent factors that group correlated variables together.
Key Results:
Factors like obesity (BMI and Triceps Skinfold Thickness) and insulin resistance (Plasma Glucose and Insulin) were identified.
Communalities were used to measure how well variables are explained by the extracted factors.

3. Cluster Analysis
Objective: Group participants into clusters based on their health indicators.
Methods Used:
Hierarchical Clustering (Euclidean and Manhattan distances)
Visualization of dendrograms to identify clusters.

4. Linear Regression Models
Objective: Predict Diabetes Pedigree Function (DPF) using selected predictors.
Models:
Model 1: Single predictor (Triceps Skinfold Thickness).
Model 2: Two predictors (Triceps Skinfold Thickness + BMI).
Model 3: Four predictors (Times Pregnant, Plasma Glucose, Triceps, and BMI).
Model Comparison: R² and AIC values were used to evaluate performance.
Model	R²	AIC	Comment
Model 1	0.0378	251.41	Single predictor; weak predictive power.
Model 2	0.0494	248.54	Best trade-off between simplicity and fit.
Model 3	0.0540	250.62	Four predictors; marginal improvement.


## Files
- **group_portfolio.R**: Code for PCA, Factor Analysis, and Clustering.
- **individual_portfolio.R**: Code for regression models and diagnostics.

## Key Visualizations

### 1. PCA Biplots
![PCA Biplot PC1 vs PC2](Rplot.png)
![PCA Biplot PC2 vs PC3](Rplot03.png)

### 2. Scree Plot
![Scree Plot](Rplot01.png)

### 3. Loadings Plot
![Loadings Plot](Rplot02.png)

### 4. Factor Analysis Diagram
![Factor Analysis](Rplot05.png)

### 5. Hierarchical Clustering
- **Euclidean Distance (Complete Linkage)**:
  ![Clustering Euclidean](Rplot06.png)
- **Manhattan Distance (Ward's Method)**:
  ![Clustering Manhattan](Rplot07.png)

### 6. Scatter Plot Matrix
![Scatter Plot Matrix](Rplot08.png)

### 7. Scatter Plot: Triceps Skinfold Thickness vs Diabetes Pedigree Function
![Scatter Plot](Rplot09.png)

### 8. Regression Diagnostic Plots
- **Model 1 Diagnostic Plots**:
  ![Model 1 Diagnostics](Rplot10.png)
- **Model 2 Diagnostic Plots**:
  ![Model 2 Diagnostics](Rplot11.png)
- **Model 3 Diagnostic Plots**:
  ![Model 3 Diagnostics](Rplot12.png)
- **Model 4 Diagnostic Plots**:
  ![Model 4 Diagnostics](Rplot13.png)

---

## Requirements
Install required R libraries:
```R
install.packages(c("tidyverse", "ggfortify", "psych", "cluster", "factoextra", "nFactors", "GGally", "olsrr"))

## Dataset
The dataset is available as `Pima_Indians_Diabetes_Dataset1.csv`.


Contributions
This project was carried out collaboratively by the following team members:

Christopher Eyare Eban: Led the Principal Component Analysis (PCA).
Tawana Joseph Mhishi & Avwerosuo Godstime Emekeme: Conducted Factor Analysis (FA).
Ndubuaku George Ekwueme: Performed Cluster Analysis.
All Members: Interpreted results, wrote the final report, and ensured a cohesive analysis

Conclusion
This project provided insights into key health indicators contributing to diabetes risk. PCA, Factor Analysis, and Cluster Analysis identified patterns and relationships in the data, while regression models highlighted predictors with marginal explanatory power. The project demonstrates the application of statistical methods and data visualization to uncover trends in health data.
