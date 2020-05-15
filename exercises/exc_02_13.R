library(tidymodels)

stack_train <- readRDS("data/c2_train.rds")
stack_test <- readRDS("data/c2_test.rds")
stack_glm <- readRDS("data/stack_glm.rds")
stack_tree <- readRDS("data/stack_tree.rds")

results <- stack_test %>%
    bind_cols(predict(stack_glm, ___) %>%
                  rename(.pred_glm = .pred_class)) %>%
    bind_cols(predict(stack_tree, ___) %>%
                  rename(.pred_tree = .pred_class))

## Calculate accuracy
___(results, truth = remote, estimate = .pred_glm)
___(results, truth = remote, estimate = .pred_tree)

## Calculate positive predict value
___(results, truth = remote, estimate = .pred_glm)
___(results, truth = remote, estimate = .pred_tree)
