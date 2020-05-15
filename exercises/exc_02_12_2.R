library(tidymodels)

stack_train <- readRDS("data/c2_train.rds")
stack_test <- readRDS("data/c2_test.rds")
stack_glm <- readRDS("data/stack_glm.rds")
stack_tree <- readRDS("data/stack_tree.rds")

results <- stack_test %>%
    bind_cols(predict(stack_tree, ___) %>%
                  rename(.pred_tree = .pred_class))

# Confusion matrix for decision tree model
results %>%
    ___(___ = remote, ___ = .pred_tree)
