library(tidymodels)

sisters_other <- readRDS("data/c4_other.rds")

sisters_recipe <- recipe(age ~ ., data = sisters_other) %>% 
    ___(all_predictors()) %>%
    ___(all_predictors(), num_comp = ___)

sisters_recipe
