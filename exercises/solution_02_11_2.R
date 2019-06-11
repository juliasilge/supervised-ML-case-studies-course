# Build a random forest model
stack_rf <- train(Remote ~ ., method = "rf", 
                  data = training,
                  trControl = trainControl(method = "boot",
                                           sampling = "up"))

# Print the model object
stack_rf
```

`@sct`
