library(caret)
library(tidyverse)

car_train <- readRDS("data/c1_training_full.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Load yardstick
library(___)

# Create the new columns
results <- car_train %>%
    mutate(`Linear regression` = predict(___, car_train),
           `Random forest` = predict(___, car_train))

# Evaluate the performance
metrics(results, truth = ___, estimate = `Linear regression`)
metrics(results, truth = ___, estimate = `Random forest`)
