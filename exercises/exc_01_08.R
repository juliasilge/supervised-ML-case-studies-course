library(randomForest)
car_train <- readRDS("data/c1_train.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Load tidymodels
library(___)

# Create the new columns
results <- car_train %>%
    mutate(MPG = log(MPG)) %>%
    bind_cols(predict(___, car_train) %>%
                  rename(.pred_lm = .pred)) %>%
    bind_cols(predict(___, car_train) %>%
                  rename(.pred_rf = .pred))

# Evaluate the performance
metrics(results, truth = ___, estimate = .pred_lm)
metrics(results, truth = ___, estimate = .pred_rf)
