library(tidymodels)

stack_train <- readRDS("data/c2_train.rds")

stack_recipe <- ___(remote ~ ., data = stack_train) %>% 
    step_downsample(___)

stack_recipe
