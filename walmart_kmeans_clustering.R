# Title: Walmart Department Clustering Using K-Means
# Course: ALY6040 – Data Mining Applications
# Author: Esther Borketey
# Institution: Northeastern University

# Description:
# This script implements K-means clustering analysis to segment Walmart departments
# based on sales behavior patterns. The analysis identifies three distinct clusters:
# Promotional-Driven, Necessity-Driven, and Specialty departments.

# Business Goal: Enable targeted retail strategies through department segmentation


# --- SECTION 1: Libraries and Setup ------------------------------------------
library(tidyverse)
library(lubridate)
library(cluster)
library(factoextra)
library(gridExtra)
library(scales)

set.seed(123)

# --- SECTION 2: Data Loading and Preparation ---------------------------------

# Load the Walmart datasets
train <- read.csv("train.csv")
features <- read.csv("features.csv")
stores <- read.csv("stores.csv")

# Merge datasets
merged <- merge(train, features, by = c("Store", "Date"), all.x = TRUE)
full_data <- merge(merged, stores, by = "Store", all.x = TRUE)
full_data$Date <- as.Date(full_data$Date, "%Y-%m-%d")

# Clean and prepare data
full_data <- full_data %>%
  rename(IsHoliday = IsHoliday.x) %>%
  # Remove markdown columns if they exist
  select(-matches("MarkDown")) %>%
  # Handle missing values
  drop_na(CPI, Unemployment) %>%
  # Convert factors
  mutate(
    Store = as.factor(Store),
    Dept = as.factor(Dept),
    Type = as.factor(Type),
    IsHoliday = as.factor(IsHoliday)
  )

print(paste("Dataset loaded with", nrow(full_data), "observations"))
print(paste("Number of departments:", length(unique(full_data$Dept))))

# --- SECTION 3: Feature Engineering for Clustering ---------------------------

# Calculate department-level aggregated metrics
dept_metrics <- full_data %>%
  group_by(Dept) %>%
  summarise(
    # Average weekly sales
    Avg_Weekly_Sales = mean(Weekly_Sales, na.rm = TRUE),
    
    # Holiday sensitivity ratio
    Holiday_Sales_Ratio = ifelse(
      mean(Weekly_Sales[IsHoliday == "FALSE"], na.rm = TRUE) == 0, 0,
      mean(Weekly_Sales[IsHoliday == "TRUE"], na.rm = TRUE) / 
      mean(Weekly_Sales[IsHoliday == "FALSE"], na.rm = TRUE)
    ),
    
    # Sales volatility (coefficient of variation)
    Sales_Volatility = sd(Weekly_Sales, na.rm = TRUE) / mean(Weekly_Sales, na.rm = TRUE),
    
    # Additional metrics
    Total_Sales = sum(Weekly_Sales, na.rm = TRUE),
    Sales_Count = n(),
    
    .groups = "drop"
  ) %>%
  # Handle any remaining NA values
  mutate(
    Holiday_Sales_Ratio = ifelse(is.na(Holiday_Sales_Ratio) | is.infinite(Holiday_Sales_Ratio), 
                                1, Holiday_Sales_Ratio),
    Sales_Volatility = ifelse(is.na(Sales_Volatility) | is.infinite(Sales_Volatility), 
                             0, Sales_Volatility)
  )

print("Department metrics calculated:")
print(head(dept_metrics))

# --- SECTION 4: Optimal Cluster Number Determination -------------------------

# Prepare data for clustering (standardize features)
clustering_features <- dept_metrics %>%
  select(Avg_Weekly_Sales, Holiday_Sales_Ratio, Sales_Volatility)

scaled_features <- scale(clustering_features)

# Method 1: Elbow Method
wss <- map_dbl(1:10, ~{
  kmeans(scaled_features, centers = .x, nstart = 25)$tot.withinss
})

elbow_plot <- data.frame(k = 1:10, wss = wss) %>%
  ggplot(aes(x = k, y = wss)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 1:10) +
  labs(title = "Elbow Method for Optimal k",
       x = "Number of Clusters (k)",
       y = "Within-Cluster Sum of Squares") +
  theme_minimal()

# Method 2: Silhouette Analysis
silhouette_scores <- map_dbl(2:10, ~{
  kmeans_result <- kmeans(scaled_features, centers = .x, nstart = 25)
  silhouette_avg <- mean(silhouette(kmeans_result$cluster, dist(scaled_features))[, 3])
  return(silhouette_avg)
})

silhouette_plot <- data.frame(k = 2:10, silhouette = silhouette_scores) %>%
  ggplot(aes(x = k, y = silhouette)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 2:10) +
  labs(title = "Silhouette Analysis for Optimal k",
       x = "Number of Clusters (k)",
       y = "Average Silhouette Width") +
  theme_minimal()

# Display optimal k selection plots
grid.arrange(elbow_plot, silhouette_plot, ncol = 2)

optimal_k <- which.max(silhouette_scores) + 1
print(paste("Optimal number of clusters:", optimal_k))

# --- SECTION 5: K-Means Clustering Implementation ----------------------------

# Perform K-means clustering with optimal k
final_kmeans <- kmeans(scaled_features, centers = optimal_k, nstart = 25)

# Add cluster assignments to department data
dept_clusters <- dept_metrics %>%
  mutate(Cluster = as.factor(final_kmeans$cluster))

# Display cluster summary
cluster_summary <- dept_clusters %>%
  group_by(Cluster) %>%
  summarise(
    Count = n(),
    Avg_Sales = mean(Avg_Weekly_Sales),
    Avg_Holiday_Ratio = mean(Holiday_Sales_Ratio),
    Avg_Volatility = mean(Sales_Volatility),
    .groups = "drop"
  )

print("Cluster Summary:")
print(cluster_summary)

# --- SECTION 6: Cluster Validation and Quality Assessment -------------------

# Calculate silhouette scores
sil_scores <- silhouette(final_kmeans$cluster, dist(scaled_features))
avg_silhouette <- mean(sil_scores[, 3])

print(paste("Average Silhouette Score:", round(avg_silhouette, 3)))

# Silhouette plot
silhouette_viz <- fviz_silhouette(sil_scores) +
  labs(title = "Silhouette Analysis of Department Clusters") +
  theme_minimal()

print(silhouette_viz)

# --- SECTION 7: Cluster Visualization ----------------------------------------

# Main cluster visualization
cluster_plot <- dept_clusters %>%
  ggplot(aes(x = Holiday_Sales_Ratio, y = Sales_Volatility, 
             size = Avg_Weekly_Sales, color =
