library(caret)
library(tidyverse)

car_train <- readRDS("data/c1_training_full.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Load yardstick
library(yardstick)

# Create the new columns
results <- car_train %>%
    mutate(`Linear regression` = predict(fit_lm, car_train),
           `Random forest` = predict(fit_rf, car_train))

# Evaluate the performance
metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)
