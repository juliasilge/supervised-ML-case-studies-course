library(tidyverse)
library(caret)

testing <- readRDS("/usr/local/share/datasets/c2_testing_full.rds")
stack_glm <- readRDS("/usr/local/share/datasets/stack_glm.rds")
stack_rf <- readRDS("/usr/local/share/datasets/stack_rf.rds")

# Load yardstick
library(yardstick)

# Predict values
testing_results <- testing %>%
    mutate(`Logistic regression` = predict(stack_glm, testing),
           `Random forest` = predict(stack_rf, testing))

## Calculate accuracy
accuracy(testing_results, truth = Remote, estimate = `Logistic regression`)
accuracy(testing_results, truth = Remote, estimate = `Random forest`)

## Calculate positive predict value
ppv(testing_results, truth = Remote, estimate = `Logistic regression`)
ppv(testing_results, truth = Remote, estimate = `Random forest`)