library(tidyverse)
library(caret)

validation <- readRDS("/usr/local/share/datasets/c4_validation_full.rds")
sisters_cart <- readRDS("/usr/local/share/datasets/sisters_cart.rds")
sisters_xgb <- readRDS("/usr/local/share/datasets/sisters_xg.rds")
sisters_gbm <- readRDS("/usr/local/share/datasets/sisters_gbm.rds")

# Make predictions on the three models
modeling_results <- validation %>%
    mutate(CART = predict(sisters_cart, validation),
           XGB = predict(sisters_xgb, validation),
           GBM = predict(sisters_gbm, validation))

# View the predictions
modeling_results %>% 
    select(CART, XGB, GBM)