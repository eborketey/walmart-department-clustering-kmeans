# Walmart Department Clustering Analysis Using K-Means

## Project Overview
K-means clustering analysis of Walmart department sales performance using 421,570+ sales records from ALY6040 Data Mining Applications course. This project segments departments into distinct performance tiers based on sales behavior patterns to support strategic retail decision-making and inventory optimization.

## Business Objective
Identify natural department groupings based on sales behavior to enable targeted strategies for inventory management, promotional planning, and performance benchmarking across Walmart's retail operations.

## Key Results
- **Segmented 81 departments** into 3 distinct performance clusters
- **Achieved 0.64 average silhouette score** indicating strong cluster quality
- **Identified three behavioral patterns**: Promotional-Driven, Necessity-Driven, and Specialty departments
- **Delivered actionable insights** for differentiated retail strategies

## Department Clusters Identified

### Cluster 1: Promotional-Driven Departments
- **Characteristics**: High holiday sensitivity, high volatility
- **Examples**: Toys, Electronics, Seasonal items
- **Strategy**: Dynamic inventory management, aggressive promotional calendars

### Cluster 2: Necessity-Driven Departments  
- **Characteristics**: Stable demand, lower volatility
- **Examples**: Grocery, Household essentials
- **Strategy**: Consistent inventory levels, everyday low pricing

### Cluster 3: Specialty Departments
- **Characteristics**: Unique behavior patterns, moderate performance
- **Examples**: Jewelry, Pharmacy, specialized categories
- **Strategy**: Targeted marketing, specialized staff training

## Technical Implementation
- **Algorithm**: K-means clustering with k=3 centers
- **Programming**: R with tidyverse, cluster packages
- **Features**: Average weekly sales, holiday sales ratio, sales volatility
- **Validation**: Silhouette analysis, elbow method, gap statistic
- **Visualization**: ggplot2 for cluster analysis and parallel coordinate plots

## Dataset Information
- **Source**: Walmart Store Sales Forecasting (Kaggle Competition)
- **Records**: 421,570 sales observations across 81 departments
- **Variables**: 15 columns across sales, store, and economic data
- **Time Period**: 2010-2012 historical weekly sales data
- **Scope**: 45 stores across multiple locations

## Methodology
1. **Data Aggregation**: Calculate department-level metrics (average sales, holiday ratio, volatility)
2. **Feature Engineering**: Create holiday sales ratio and coefficient of variation
3. **Optimal Cluster Selection**: Use silhouette analysis, elbow method, and gap statistic
4. **K-Means Implementation**: Apply clustering with standardized features
5. **Cluster Validation**: Bootstrap resampling and stability analysis
6. **Business Interpretation**: Translate clusters into actionable strategies

## Model Performance
- **Silhouette Score**: 0.64 (indicating good cluster separation)
- **Cluster Stability**: >0.75 Jaccard similarity across bootstrap samples
- **Davies-Bouldin Index**: 0.68 (lower values indicate better separation)
- **Between/Within Cluster Variance Ratio**: 3.7

## Business Impact
- **Strategic Segmentation**: Clear identification of department behavioral patterns
- **Resource Optimization**: Targeted allocation based on cluster characteristics  
- **Performance Benchmarking**: Within-cluster comparison for improvement opportunities
- **Inventory Management**: Cluster-specific stocking and promotional strategies

## Key Insights
- **Holiday Sensitivity**: Primary differentiating factor between clusters
- **Sales Volatility**: Secondary factor creating distinct operational requirements
- **Natural Groupings**: Clusters transcend traditional category boundaries
- **Strategic Alignment**: Each cluster requires different management approaches

## 📂 Repository Structure
walmart-department-clustering-kmeans/
├── README.md
├── walmart_kmeans_clustering.R
├── requirements.R
├── data/
│   └── README.md
├── visualizations/
│   ├── cluster_scatter_plot.png
│   ├── parallel_coordinates.png
│   └── silhouette_analysis.png
└── documentation/
├── methodology.md
└── business_insights.md

## 🔧 Usage
```r
# Install required packages
source("requirements.R")

# Run clustering analysis
source("walmart_kmeans_clustering.R")

Academic Context
This analysis was conducted as part of ALY6040 Data Mining Applications at Northeastern University, demonstrating practical application of unsupervised machine learning techniques in retail analytics and business intelligence.

About
Created by Esther Borketey as part of a comprehensive multi-method data mining project, showcasing K-means clustering expertise for retail analytics and strategic business segmentation.

Email: borketey.e@northeastern.edu
LinkedIn: [Your LinkedIn]
Portfolio: [Your Portfolio URL]

Recognition
Part of a comprehensive retail intelligence framework that successfully transformed 421,570+ Walmart sales records into actionable business insights using multiple machine learning techniques.

