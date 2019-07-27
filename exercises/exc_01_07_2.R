library(tidyverse)
library(caret)

car_train <- readRDS("/usr/local/share/datasets/c1_training_full.rds")
car_test <- readRDS("/usr/local/share/datasets/c1_testing_full.rds")

# Train a random forest model
fit_rf <- ___(log(MPG) ~ ., 
                method = ___, 
                data = ___,
                trControl = trainControl(method = "none"))

# Print the model object
fit_rf
