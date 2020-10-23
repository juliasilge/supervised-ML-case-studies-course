library(tidymodels)
library(themis)

stack_train <- readRDS("data/c2_train.rds")

stack_recipe <- recipe(remote ~ ., data = stack_train) %>% 
    step_downsample(remote)

## Build a logistic regression model
glm_spec <- ___ %>%
    set_engine("glm")

## Start a workflow (recipe only)
stack_wf <- ___ %>%
    add_recipe(stack_recipe)

## Add the model and fit the workflow
stack_glm <- stack_wf %>%
    add_model(___) %>%
    fit(data = stack_train)

# Print the fitted model
stack_glm
