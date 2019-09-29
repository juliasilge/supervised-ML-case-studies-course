library(tidyverse)
library(caret)

sisters_validate <- readRDS("data/c4_validation_full.rds")
sisters_test <- readRDS("data/c4_testing_full.rds")
sisters_cart <- readRDS("data/sisters_cart.rds")
sisters_gbm <- readRDS("data/sisters_gbm.rds")
sisters_xgb <- readRDS("data/sisters_xg.rds")

# Make predictions on the three models
modeling_results <- sisters_validate %>%
    mutate(CART = predict(sisters_cart, ___),
           GBM = predict(sisters_gbm, ___),
           XGB = predict(sisters_xgb, ___))

# View the predictions
modeling_results %>% 
    select(CART, GBM, XGB)
