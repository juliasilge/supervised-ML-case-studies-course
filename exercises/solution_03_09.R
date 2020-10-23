library(tidymodels)
library(themis)

vote_train <- readRDS("data/c3_train.rds")

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016)

## Specify a ranger model
rf_spec <- rand_forest() %>%
    set_engine("ranger") %>%
    set_mode("classification")

## Add the recipe + model to a workflow
vote_wf <- workflow() %>%
    add_recipe(vote_recipe) %>%
    add_model(rf_spec)

vote_wf
