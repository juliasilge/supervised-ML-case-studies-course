# Train a random forest model
fit_rf <- train(log(MPG) ~ ., method = "rf", data = training,
                trControl = trainControl(method = "none"))

# Print the model object
fit_rf