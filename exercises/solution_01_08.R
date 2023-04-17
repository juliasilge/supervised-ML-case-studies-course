library(tidyverse)
library(arrow)
car_train <- read_parquet("data/c1_train.parquet")
fit_lm <- read_rds("data/c1_fit_lm.rds")
fit_rf <- read_rds("data/c1_fit_rf.rds")

# Load tidymodels
library(tidymodels)

# Create the new columns
results <- car_train %>%
    mutate(mpg = log(mpg)) %>%
    bind_cols(predict(fit_lm, car_train) %>%
                  rename(.pred_lm = .pred)) %>%
    bind_cols(predict(fit_rf, car_train) %>%
                  rename(.pred_rf = .pred))

# Evaluate the performance
metrics(results, truth = mpg, estimate = .pred_lm)
metrics(results, truth = mpg, estimate = .pred_rf)
