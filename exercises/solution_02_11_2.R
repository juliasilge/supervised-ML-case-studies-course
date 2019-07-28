library(tidyverse)
library(caret)

stack_train <- readRDS("data/c2_training_one_percent.rds")
stack_test <- readRDS("data/c2_testing_one_percent.rds")

# Build a random forest model
stack_rf <- train(Remote ~ ., method = "rf", 
                  data = stack_train,
                  trControl = trainControl(method = "boot",
                                           sampling = "up"))

# Print the model object
stack_rf

