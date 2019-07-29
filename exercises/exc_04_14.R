library(tidyverse)
library(caret)
library(yardstick)

sisters_train <- readRDS("data/c4_training_full.rds")
sisters_validate <- readRDS("data/c4_validation_full.rds")
sisters_test <- readRDS("data/c4_testing_full.rds")
sisters_gbm <- readRDS("data/sisters_gbm.rds")

# Calculate RMSE
___ %>%
    mutate(prediction = predict(sisters_gbm, ___)) %>%
    ___(truth = age, estimate = prediction)
