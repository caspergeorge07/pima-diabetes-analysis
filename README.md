# Pima Indians Diabetes Analysis

## Overview
This project analyzes the **Pima Indians Diabetes Dataset** using R for the following tasks:
- **Principal Component Analysis (PCA)**
- **Factor Analysis**
- **Hierarchical Clustering**
- **Regression Modeling**

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

## Instructions
1. Clone this repository:
   ```bash
   git clone <repository-url>
