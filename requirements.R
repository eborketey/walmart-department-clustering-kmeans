# Required R packages for Walmart Department Clustering Analysis
# Install and load all necessary packages

# List of required packages
required_packages <- c(
  "tidyverse",      # Data manipulation and visualization
  "lubridate",      # Date handling
  "cluster",        # Clustering algorithms and validation
  "factoextra",     # Enhanced clustering visualization
  "gridExtra",      # Multiple plot arrangements
  "scales",         # Scale functions for ggplot2
  "viridis",        # Color palettes
  "dplyr",          # Data manipulation
  "ggplot2"         # Data visualization
)

# Function to install missing packages
install_if_missing <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) {
    cat("Installing missing packages:", paste(new_packages, collapse = ", "), "\n")
    install.packages(new_packages, dependencies = TRUE)
  } else {
    cat("All required packages are already installed.\n")
  }
}

# Install missing packages
install_if_missing(required_packages)

# Load all packages
cat("Loading required packages...\n")
lapply(required_packages, function(pkg) {
  library(pkg, character.only = TRUE)
  cat("✓", pkg, "loaded\n")
})

cat("\n=== PACKAGE SETUP COMPLETE ===\n")
cat("All required packages for Walmart K-means clustering analysis are ready!\n")
cat("Run the main analysis with: source('walmart_kmeans_clustering.R')\n")

# Display session info for reproducibility
cat("\n=== SESSION INFO ===\n")
print(sessionInfo())
