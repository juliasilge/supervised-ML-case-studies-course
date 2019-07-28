library(tidyverse)
library(caret)

vote_train <- readRDS("/usr/local/share/datasets/c3_training_two_percent.rds")

# Random forest
vote_rf <- train(turnout16_2016 ~ ., method = "rf", 
                 data = training,
                 trControl = trainControl(___,
                                          ___,
                                          sampling = "up"))

# Print vote_rf
vote_rf

