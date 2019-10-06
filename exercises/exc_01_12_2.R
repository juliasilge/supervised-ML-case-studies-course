library(caret)
library(tidyverse)
library(yardstick)

car_test <- readRDS("data/c1_testing_full.rds")
cars_lm_bt <- readRDS("data/cars_lm_bt.rds")
cars_rf_bt <- readRDS("data/cars_rf_bt.rds")

results <- car_test %>%
    mutate(MPG = log(MPG),
           `Linear regression` = predict(cars_lm_bt, car_test),
           `Random forest` = predict(cars_rf_bt, car_test))

results %>%
    gather(Method, Result, `Linear regression`:`Random forest`) %>%
    ggplot(aes(MPG, Result, color = Method)) +
    geom_point(size = 1.5, alpha = 0.5) +
    facet_wrap(~Method) +
    geom_abline(lty = 2, color = "gray50") +
    geom_smooth(method = "lm")

