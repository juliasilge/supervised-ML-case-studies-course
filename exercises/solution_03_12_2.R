# Random forest
vote_rf <- train(turnout16_2016 ~ ., method = "rf", 
                 data = training,
                 trControl = trainControl(method = "repeatedcv",
                                          repeats = 2,
                                          sampling = "up"))
# Print vote_rf
vote_rf