library(caret)
library(tidyverse)
library(yardstick)

testing <- readRDS("/usr/local/share/datasets/c1_testing_full.rds")
fit_lm <- readRDS("/usr/local/share/datasets/c1_fit_lm.rds")
fit_rf <- readRDS("/usr/local/share/datasets/c1_fit_rf.rds")

# Create the new columns
results <- testing %>%
    mutate(`Linear regression` = predict(fit_lm, testing),
           `Random forest` = predict(fit_rf, testing))

# Evaluate the performance
metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)