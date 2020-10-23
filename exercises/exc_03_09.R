library(tidymodels)
library(themis)

vote_train <- readRDS("data/c3_train.rds")

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016)

## Specify a ranger model
rf_spec <- ___ %>%
    set_engine("ranger") %>%
    set_mode("classification")

## Add the recipe + model to a workflow
vote_wf <- workflow() %>%
    ___(vote_recipe) %>%
    ___(rf_spec)

vote_wf
