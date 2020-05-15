library(tidymodels)

stack_train <- readRDS("data/c2_train.rds")

stack_recipe <- recipe(remote ~ ., data = stack_train) %>% 
    step_downsample(remote)

stack_prep <- prep(stack_recipe)
stack_down <- juice(stack_prep)

stack_down %>%
    count(remote)
