library(tidyverse)
library(caret)

stack_train <- readRDS("data/c2_training_one_percent.rds")

# Build a random forest model
stack_rf <- train(Remote ~ ., ___, 
                  data = stack_train,
                  trControl = trainControl(method = "boot",
                                           ___))

# Print the model object
stack_rf

