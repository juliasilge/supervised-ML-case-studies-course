library(tidymodels)

tree_spec <- ___(
    ___ = tune(),
    ___ = tune()
) %>% 
    set_engine("rpart") %>% 
    set_mode("regression")

tree_spec
