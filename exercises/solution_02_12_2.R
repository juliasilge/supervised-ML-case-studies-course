# Set seed
set.seed(123)

# Confusion matrix for random forest model
confusionMatrix(predict(stack_rf, testing),
                testing$Remote)
