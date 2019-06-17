library(caret)
library(tidyverse)
library(yardstick)

car_test <- readRDS("/usr/local/share/datasets/c1_testing_full.rds")
cars_lm_bt <- readRDS("/usr/local/share/datasets/cars_lm_bt.rds")
cars_rf_bt <- readRDS("/usr/local/share/datasets/cars_rf_bt.rds")

results <- car_test %>%
    ___(`Linear regression` = predict(cars_lm_bt, testing),
           `Random forest` = predict(cars_rf_bt, testing))

metrics(results, ___ = MPG, ___ = `Linear regression`)
metrics(results, ___ = MPG, ___ = `Random forest`)
