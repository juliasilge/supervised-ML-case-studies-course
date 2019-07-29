data/(caret)
data/(tidyverse)
data/(yardstick)

car_test <- readRDS("data/c1_testing_full.rds")
cars_lm_bt <- readRDS("data/cars_lm_bt.rds")
cars_rf_bt <- readRDS("data/cars_rf_bt.rds")

results <- car_test %>%
    mutate(`Linear regression` = predict(cars_lm_bt, car_test),
           `Random forest` = predict(cars_rf_bt, car_test))

metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)