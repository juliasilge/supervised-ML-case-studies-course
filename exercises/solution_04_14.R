library(tidyverse)
library(caret)
library(yardstick)

testing <- readRDS("/usr/local/share/datasets/c4_testing_full.rds")
sisters_gbm <- readRDS("/usr/local/share/datasets/sisters_gbm.rds")

# Calculate RMSE
testing %>%
    mutate(prediction = predict(sisters_gbm, testing)) %>%
    rmse(truth = age, estimate = prediction)