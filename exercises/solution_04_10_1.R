library(tidymodels)

sisters_other <- readRDS("data/c4_other.rds")

sisters_recipe <- recipe(age ~ ., data = sisters_other) %>% 
    step_normalize(all_predictors()) %>%
    step_pca(all_predictors(), num_comp = tune())

sisters_recipe
