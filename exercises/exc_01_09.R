library(tidymodels)
library(randomForest)

car_test <- readRDS("data/c1_test.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Create the new columns
results <- ___ %>%
    mutate(MPG = log(MPG)) %>%
    bind_cols(predict(fit_lm, ___) %>%
                  rename(.pred_lm = .pred)) %>%
    bind_cols(predict(fit_rf, ___) %>%
                  rename(.pred_rf = .pred))

# Evaluate the performance
metrics(results, truth = MPG, estimate = .pred_lm)
metrics(results, truth = MPG, estimate = .pred_rf)
