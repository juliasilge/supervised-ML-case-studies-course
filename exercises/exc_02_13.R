library(tidyverse)
library(caret)

stack_test <- readRDS("/usr/local/share/datasets/c2_testing_full.rds")
stack_glm <- readRDS("/usr/local/share/datasets/stack_glm.rds")
stack_rf <- readRDS("/usr/local/share/datasets/stack_rf.rds")

# Load yardstick
library(___)

# Predict values
testing_results <- testing %>%
    mutate(`Logistic regression` = predict(___, stack_test),
           `Random forest` = predict(___, stack_test))

## Calculate accuracy
___(testing_results, truth = Remote, estimate = `Logistic regression`)
___(testing_results, truth = Remote, estimate = `Random forest`)

## Calculate positive predict value
___(testing_results, truth = Remote, estimate = `Logistic regression`)
___(testing_results, truth = Remote, estimate = `Random forest`)

