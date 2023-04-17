library(tidymodels)
library(tidyverse)
car_test <- read_parquet("data/c1_test.parquet")
fit_lm <- read_rds("data/c1_fit_lm.rds")
fit_rf <- read_rds("data/c1_fit_rf.rds")

# Create the new columns
results <- ___ %>%
    mutate(mpg = log(mpg)) %>%
    bind_cols(predict(fit_lm, ___) %>%
                  rename(.pred_lm = .pred)) %>%
    bind_cols(predict(fit_rf, ___) %>%
                  rename(.pred_rf = .pred))

# Evaluate the performance
metrics(results, truth = mpg, estimate = .pred_lm)
metrics(results, truth = mpg, estimate = .pred_rf)
