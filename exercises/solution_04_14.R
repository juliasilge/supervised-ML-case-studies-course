library(tidyverse)
library(caret)
library(yardstick)

sisters_train <- readRDS("/usr/local/share/datasets/c4_training_full.rds")
sisters_validate <- readRDS("/usr/local/share/datasets/c4_validation_full.rds")
sisters_test <- readRDS("/usr/local/share/datasets/c4_testing_full.rds")
sisters_gbm <- readRDS("/usr/local/share/datasets/sisters_gbm.rds")

# Calculate RMSE
sisters_test %>%
    mutate(prediction = predict(sisters_gbm, sisters_test)) %>%
    rmse(truth = age, estimate = prediction)