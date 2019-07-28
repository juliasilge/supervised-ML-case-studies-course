library(tidyverse)
library(caret)

modeling_results <- readRDS("/usr/local/share/datasets/c4_modeling_results.rds")

# Load yardstick
___

# Compare performace for...

# ...CART model
metrics(modeling_results, truth = ___, estimate = ___)
# ...xgboost model
metrics(modeling_results, truth = ___, estimate = ___)
# ...gbm model
___(modeling_results, truth = ___, estimate = ___)
