library(tidymodels)

tree_spec <- decision_tree(
    cost_complexity = tune(),
    tree_depth = tune()
) %>% 
    set_engine("rpart") %>% 
    set_mode("regression")

tree_spec
