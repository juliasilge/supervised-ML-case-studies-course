library(tidymodels)

stack_train <- readRDS("data/c2_train.rds")

stack_recipe <- recipe(remote ~ ., data = stack_train) %>% 
    step_downsample(remote)

stack_prep <- prep(___)
stack_down <- bake(___, new_data = NULL)

stack_down %>%
    count(remote)
