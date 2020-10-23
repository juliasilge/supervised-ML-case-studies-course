library(tidymodels)
library(themis)

stack_train <- readRDS("data/c2_train.rds")

stack_recipe <- recipe(remote ~ ., data = stack_train) %>% 
    step_downsample(remote)

## Build a decision tree model
tree_spec <- decision_tree() %>%         
    set_engine("rpart") %>%      
    set_mode("classification") 

## Start a workflow (recipe only)
stack_wf <- workflow() %>%
    add_recipe(stack_recipe)

## Add the model and fit the workflow
stack_tree <- stack_wf %>%
    add_model(tree_spec) %>%
    fit(data = stack_train)

# Print the fitted model
stack_tree
