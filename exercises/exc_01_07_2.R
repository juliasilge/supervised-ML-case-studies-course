# Train a random forest model
fit_rf <- ___(log(MPG) ~ ., 
                method = ___, 
                data = ___,
                trControl = trainControl(method = "none"))

# Print the model object
fit_rf


