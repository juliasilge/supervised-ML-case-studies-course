library(tidyverse)
library(caret)

car_train <- readRDS("data/c1_training_full.rds")
car_test <- readRDS("data/c1_testing_full.rds")

# Train a random forest model
fit_rf <- ___(log(MPG) ~ ., 
                method = ___, 
                data = ___,
                trControl = trainControl(method = "none"))

# Print the model object
fit_rf
