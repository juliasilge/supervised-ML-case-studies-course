library(tidyverse)
training <- readRDS("/usr/local/share/datasets/c4_training_500.rds")

# Load caret
library(caret)

# Fit a CART model
sisters_cart <- ___(___, method = ___, data = ___)

# Print the CART model
sisters_cart

