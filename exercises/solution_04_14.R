library(tidyverse)
library(caret)
library(yardstick)

sisters_train <- readRDS("data/c4_training_500.rds")
sisters_validate <- readRDS("data/c4_validation_full.rds")
sisters_test <- readRDS("data/c4_testing_full.rds")
sisters_gbm <- readRDS("data/sisters_gbm.rds")

# Calculate RMSE
sisters_test %>%
    mutate(prediction = predict(sisters_gbm, sisters_test)) %>%
    rmse(truth = age, estimate = prediction)
