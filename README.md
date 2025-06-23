# Walmart Department Clustering Analysis Using K-Means
## Project Overview
K-means clustering analysis of Walmart department sales performance using 421,570+ sales records. This project segments departments into distinct performance tiers to support strategic retail decision-making and inventory optimization.

## Business Objective
Identify department performance clusters to enable targeted strategies for inventory management, promotional planning, and benchmarking across Walmart's retail operations.

## Key Results
- **Clustered 45,000+ department records** into 3 distinct performance tiers
- **Achieved meaningful segmentation** of low, medium, and high-performing departments
- **Identified strategic opportunities** for performance improvement and benchmarking
- **Delivered actionable insights** for retail optimization strategies

## Technical Implementation
- **Algorithm**: K-means clustering with 3 centers
- **Programming**: R with tidyverse, cluster packages
- **Data Processing**: Aggregation of 421,570 sales records by department
- **Visualization**: ggplot2 for cluster analysis plots
- **Evaluation**: Silhouette analysis for cluster validation

## Dataset Information
- **Source**: Walmart Store Sales Forecasting (Kaggle Competition)
- **Records**: 421,570 sales observations
- **Variables**: 15 columns across sales, store, and economic data
- **Time Period**: Historical weekly sales data
- **Scope**: Multiple departments across various store locations

## Methodology
1. **Data Aggregation**: Calculate average weekly sales per department
2. **Feature Scaling**: Standardize sales metrics for clustering
3. **K-Means Application**: Apply clustering with k=3 for business interpretability
4. **Cluster Analysis**: Evaluate and interpret performance tiers
5. **Business Insights**: Translate clusters into actionable strategies

## Business Impact
- **Performance Benchmarking**: Clear identification of top, mid, and low-tier departments
- **Strategic Segmentation**: Enables targeted improvement strategies
- **Inventory Optimization**: Informs stocking decisions based on performance clusters
- **Promotional Planning**: Supports differentiated marketing approaches by cluster

## Key Insights
- **High-Tier Clusters**: Represent anchor departments driving significant revenue
- **Mid-Tier Performance**: Departments with growth potential and optimization opportunities  
- **Low-Tier Focus**: Categories requiring strategic intervention or promotional support
- **Clear Segmentation**: Distinct performance boundaries enable targeted actions

## Repository Structure
walmart-department-clustering-kmeans/
├── README.md
├── walmart_kmeans_clustering.R
├── requirements.R
├── data/
│   └── README.md
├── visualizations/
│   └── clustering_analysis.png
└── documentation/
├── methodology.md
└── business_insights.md

## Usage
```r
# Install required packages
source("requirements.R")

# Run clustering analysis
source("walmart_kmeans_clustering.R")

Visualization
The analysis includes professional clustering visualizations showing:

Department distribution across performance clusters
Average sales by cluster tier
Strategic segmentation for business decision-making

About
Created by Esther Borketey as part of ALY6040 Data Mining course, showcasing unsupervised machine learning techniques for retail analytics and business intelligence.

Email: borketey.e@northeastern.edu
LinkedIn: [https://www.linkedin.com/in/esther-borketey/]
Portfolio: [https://www.datascienceportfol.io/naaborkor]
