library(tidyverse)
library(caret)

sisters_validate <- readRDS("data/c4_validation_full.rds")
sisters_test <- readRDS("data/c4_testing_full.rds")
sisters_cart <- readRDS("data/sisters_cart.rds")
sisters_xgb <- readRDS("data/sisters_xg.rds")
sisters_gbm <- readRDS("data/sisters_gbm.rds")

# Make predictions on the three models
modeling_results <- sisters_validate %>%
    mutate(CART = predict(sisters_cart, sisters_validate),
           XGB = predict(sisters_xgb, sisters_validate),
           GBM = predict(sisters_gbm, sisters_validate))

# View the predictions
modeling_results %>% 
    select(CART, XGB, GBM)