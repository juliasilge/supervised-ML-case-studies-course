library(tidyverse)
library(caret)
library(yardstick)

vote_train <- readRDS("/usr/local/share/datasets/c3_training_full.rds")
vote_test <- readRDS("/usr/local/share/datasets/c3_testing_full.rds")
vote_glm <- readRDS("/usr/local/share/datasets/vote_glm.rds")
vote_rf <- readRDS("/usr/local/share/datasets/vote_rf.rds")

# Confusion matrix for logistic regression model on training data
vote_train %>%
    mutate(`Logistic regression` = predict(vote_glm, vote_train)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Logistic regression")
