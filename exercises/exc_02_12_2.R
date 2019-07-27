library(caret)
library(tidyverse)
library(yardstick)

stack_train <- readRDS("/usr/local/share/datasets/c2_training_full.rds")
stack_test <- readRDS("/usr/local/share/datasets/c2_testing_full.rds")
stack_glm <- readRDS("/usr/local/share/datasets/stack_glm.rds")
stack_rf <- readRDS("/usr/local/share/datasets/stack_rf.rds")

# Confusion matrix for random forest model
stack_test %>%
    mutate(`Random forest` = predict(stack_rf, ___)) %>%
    ___(___ = Remote, ___ = "Random forest")


