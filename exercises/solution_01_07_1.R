library(tidyverse)
library(caret)

car_train <- readRDS("data/c1_training_full.rds")
car_test <- readRDS("data/c1_testing_full.rds")

# Train a linear regression model
fit_lm <- train(log(MPG) ~ ., 
                method = "lm", 
                data = car_train,
                trControl = trainControl(method = "none"))

# Print the model object
fit_lm
