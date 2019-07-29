library(tidyverse)
library(caret)

stack_test <- readRDS("data/c2_testing_full.rds")
stack_glm <- readRDS("data/stack_glm.rds")
stack_rf <- readRDS("data/stack_rf.rds")

# Load yardstick
library(yardstick)

# Predict values
testing_results <- testing %>%
    mutate(`Logistic regression` = predict(stack_glm, stack_test),
           `Random forest` = predict(stack_rf, stack_test))

## Calculate accuracy
accuracy(testing_results, truth = Remote, estimate = `Logistic regression`)
accuracy(testing_results, truth = Remote, estimate = `Random forest`)

## Calculate positive predict value
ppv(testing_results, truth = Remote, estimate = `Logistic regression`)
ppv(testing_results, truth = Remote, estimate = `Random forest`)