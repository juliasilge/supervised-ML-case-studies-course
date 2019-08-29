library(tidyverse)
library(caret)

vote_train <- readRDS("data/c3_training_two_percent.rds")

# Random forest
vote_rf <- train(turnout16_2016 ~ ., method = "rf", 
                 data = vote_train,
                 trControl = trainControl(method = "repeatedcv",
                                          repeats = 2,
                                          sampling = "up"))

# Print vote_rf
vote_rf
