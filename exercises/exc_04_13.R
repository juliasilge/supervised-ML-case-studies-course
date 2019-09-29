library(tidyverse)
library(caret)

modeling_results <- readRDS("data/c4_modeling_results.rds")

# Load yardstick
___

# Compare performance for...

# ...CART model
metrics(modeling_results, truth = ___, estimate = ___)
# ...gbm model
___(modeling_results, truth = ___, estimate = ___)
# ...xgboost model
metrics(modeling_results, truth = ___, estimate = ___)
