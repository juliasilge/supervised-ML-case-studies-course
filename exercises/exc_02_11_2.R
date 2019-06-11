# Build a random forest model
stack_rf <- train(Remote ~ ., ___, 
                  data = training,
                  trControl = trainControl(method = "boot",
                                           ___))

# Print the model object
stack_rf

