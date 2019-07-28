library(tidyverse)
library(caret)

modeling_results <- readRDS("/usr/local/share/datasets/c4_modeling_results.rds")

# Load yardstick
library(yardstick)

# Compare performance for...

# ...CART model
metrics(modeling_results, truth = age, estimate = CART)
# ...xgboost model
metrics(modeling_results, truth = age, estimate = XGB)
# ...gbm model
metrics(modeling_results, truth = age, estimate = GBM)