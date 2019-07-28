library(tidyverse)
library(caret)
library(yardstick)

vote_train <- readRDS("data/c3_training_full.rds")
vote_test <- readRDS("data/c3_testing_full.rds")
vote_glm <- readRDS("data/vote_glm.rds")
vote_rf <- readRDS("data/vote_rf.rds")

# Confusion matrix for logistic regression model on training data
vote_train %>%
    mutate(`Logistic regression` = predict(vote_glm, vote_train)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Logistic regression")
