library(caret)
library(tidyverse)

car_train <- readRDS("/usr/local/share/datasets/c1_training_one_percent.rds")

# Fit the models with bootstrap resampling
cars_lm_bt <- train(log(MPG) ~ ., 
                    method = "lm", 
                    data = car_train,
                    trControl = trainControl(method = "boot"))

cars_rf_bt <- train(log(MPG) ~ ., 
                    method = "rf", 
                    data = car_train,
                    trControl = trainControl(method = "boot"))

# Quick look at the models
cars_lm_bt
cars_rf_bt
