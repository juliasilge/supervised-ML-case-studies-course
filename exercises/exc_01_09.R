library(caret)
library(tidyverse)
library(yardstick)

car_test <- readRDS("/usr/local/share/datasets/c1_testing_full.rds")
fit_lm <- readRDS("/usr/local/share/datasets/c1_fit_lm.rds")
fit_rf <- readRDS("/usr/local/share/datasets/c1_fit_rf.rds")

# Create the new columns
results <- ___ %>%
    mutate(`Linear regression` = predict(fit_lm, ___),
           `Random forest` = predict(fit_rf, ___))

# Evaluate the performance
metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)

