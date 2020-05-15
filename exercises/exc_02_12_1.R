library(tidymodels)

stack_train <- readRDS("data/c2_train.rds")
stack_test <- readRDS("data/c2_test.rds")
stack_glm <- readRDS("data/stack_glm.rds")
stack_tree <- readRDS("data/stack_tree.rds")

results <- stack_test %>%
    bind_cols(predict(stack_glm, stack_test) %>%
                  rename(.pred_glm = .pred_class))

# Confusion matrix for logistic regression model
results %>%
    conf_mat(___ = remote, ___ = .pred_glm)
