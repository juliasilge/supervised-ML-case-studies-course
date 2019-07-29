library(caret)
library(tidyverse)
library(yardstick)

stack_train <- readRDS("data/c2_training_full.rds")
stack_test <- readRDS("data/c2_testing_full.rds")
stack_glm <- readRDS("data/stack_glm.rds")
stack_rf <- readRDS("data/stack_rf.rds")

# Confusion matrix for logistic regression model
stack_test %>%
    mutate(`Logistic regression` = predict(stack_glm, ___)) %>%
    conf_mat(___ = Remote, ___ = "Logistic regression")


