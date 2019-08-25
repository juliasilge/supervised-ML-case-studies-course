library(caret)
library(tidyverse)
library(yardstick)

car_test <- readRDS("data/c1_testing_full.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Create the new columns
results <- car_test %>%
    mutate(`Linear regression` = predict(fit_lm, testing),
           `Random forest` = predict(fit_rf, testing))

# Evaluate the performance
metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)