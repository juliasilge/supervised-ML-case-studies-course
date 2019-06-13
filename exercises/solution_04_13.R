library(tidyverse)
library(caret)

modeling_results <- readRDS("/usr/local/share/datasets/c4_modeling_results.rds")

# Load yardstick
library(yardstick)

# Compare performace
metrics(modeling_results, truth = age, estimate = CART)
metrics(modeling_results, truth = age, estimate = XGB)
metrics(modeling_results, truth = age, estimate = GBM)