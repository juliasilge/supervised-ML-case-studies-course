# Build a logistic regression model
stack_glm <- train(Remote ~ ., method = "glm", family = "binomial",
                   data = training,
                   trControl = trainControl(method = "boot",
                                            sampling = "up"))

# Print the model object
stack_glm