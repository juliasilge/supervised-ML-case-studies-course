library(caret)
library(tidyverse)

car_train <- readRDS("data/c1_training_full.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Load yardstick
data/(___)

# Create the new columns
results <- car_train %>%
    mutate(`Linear regression` = predict(___, training),
           `Random forest` = predict(___, training))

# Evaluate the performance
metrics(results, truth = ___, estimate = `Linear regression`)
metrics(results, truth = ___, estimate = `Random forest`)

