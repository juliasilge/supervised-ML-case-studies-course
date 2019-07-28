library(tidyverse)
library(caret)
library(yardstick)

vote_train <- readRDS("/usr/local/share/datasets/c3_training_full.rds")
vote_test <- readRDS("/usr/local/share/datasets/c3_testing_full.rds")
vote_glm <- readRDS("/usr/local/share/datasets/vote_glm.rds")
vote_rf <- readRDS("/usr/local/share/datasets/vote_rf.rds")

# Confusion matrix for logistic regression model on testing data
vote_test %>%
    mutate(`Logistic regression` = ___(___, ___)) %>%
    ___(truth = ___, estimate = "___")
