library(tidyverse)
sisters_train <- readRDS("/usr/local/share/datasets/c4_training_500.rds")

# Load caret
library(caret)

# Fit a CART model
sisters_cart <- train(age ~ ., method = "rpart", data = sisters_train)

# Print the CART model
sisters_cart