library(tidymodels)

car_test <- readRDS("data/c1_test.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Create the new columns
results <- car_test %>%
    mutate(mpg = log(mpg)) %>%
    bind_cols(predict(fit_lm, car_test) %>%
                  rename(.pred_lm = .pred)) %>%
    bind_cols(predict(fit_rf, car_test) %>%
                  rename(.pred_rf = .pred))

# Evaluate the performance
metrics(results, truth = mpg, estimate = .pred_lm)
metrics(results, truth = mpg, estimate = .pred_rf)
