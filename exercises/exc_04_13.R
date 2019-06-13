library(tidyverse)
library(caret)

modeling_results <- readRDS("/usr/local/share/datasets/c4_modeling_results.rds")

# Load yardstick
___

# Compare performace
metrics(modeling_results, truth = ___, estimate = ___)
metrics(modeling_results, truth = ___, estimate = ___)
___(modeling_results, truth = ___, estimate = ___)
