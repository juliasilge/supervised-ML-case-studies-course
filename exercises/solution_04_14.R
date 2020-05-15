library(tidyverse)
library(tidymodels)

tree_res <- readRDS("data/c4_tree_res.rds")
sisters_other <- readRDS("data/c4_other.rds")

sisters_recipe <- recipe(age ~ ., data = sisters_other) %>% 
    step_normalize(all_predictors()) %>%
    step_pca(all_predictors(), num_comp = tune())

tree_spec <- decision_tree(
    cost_complexity = tune(),
    tree_depth = tune()
) %>% 
    set_engine("rpart") %>% 
    set_mode("regression")

tree_wf <- workflow() %>%
    add_recipe(sisters_recipe) %>%
    add_model(tree_spec)

tree_wf


best_tree <- tree_res %>%
    select_best("rmse")

best_tree

final_wf <- tree_wf %>% 
    finalize_workflow(best_tree)

final_wf

