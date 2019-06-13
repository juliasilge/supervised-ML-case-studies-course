# Confusion matrix for random forest model on training data
confusionMatrix(predict(vote_rf, training),
                training$turnout16_2016)