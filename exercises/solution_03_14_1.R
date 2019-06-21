library(tidyverse)
library(caret)

training <- readRDS("/usr/local/share/datasets/c3_training_full.rds")
vote_glm <- readRDS("/usr/local/share/datasets/vote_glm.rds")
vote_rf <- readRDS("/usr/local/share/datasets/vote_rf.rds")
set.seed(123)

# Confusion matrix for logistic regression model on training data
confusionMatrix(predict(vote_glm, training),
                training$turnout16_2016)