# Confusion matrix for random forest model on testing data
confusionMatrix(predict(vote_rf, testing),
                testing$turnout16_2016)