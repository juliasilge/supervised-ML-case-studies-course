library(caret)
library(tidyverse)
library(yardstick)

car_test <- readRDS("/usr/local/share/datasets/c1_testing_full.rds")
cars_lm_bt <- readRDS("/usr/local/share/datasets/cars_lm_bt.rds")
cars_rf_bt <- readRDS("/usr/local/share/datasets/cars_rf_bt.rds")

results <- car_test %>%
    mutate(`Linear regression` = predict(cars_lm_bt, car_test),
           `Random forest` = predict(cars_rf_bt, car_test))

metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)