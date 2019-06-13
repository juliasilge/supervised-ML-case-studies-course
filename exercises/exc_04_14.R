library(tidyverse)
library(caret)
library(yardstick)

testing <- readRDS("/usr/local/share/datasets/c4_testing_full.rds")
sisters_gbm <- readRDS("/usr/local/share/datasets/sisters_gbm.rds")

# Calculate RMSE
___ %>%
    mutate(prediction = predict(sisters_gbm, ___)) %>%
    ___(truth = age, estimate = prediction)
