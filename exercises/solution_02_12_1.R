# Set seed
set.seed(123)

# Confusion matrix for logistic regression model
confusionMatrix(predict(stack_glm, testing),
                testing$Remote)