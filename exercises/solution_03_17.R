library(tidyverse)
library(tidymodels)

voters_select <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
    select(-case_identifier)

## Training / testing split
set.seed(1234)
vote_split <- voters_select %>%
    initial_split(p = 0.8,
                  strata = turnout16_2016)
vote_train <- training(vote_split)
vote_test <- testing(vote_split)

## Preprocess with a recipe
vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016)

## Model specification
glm_spec <- logistic_reg() %>%
    set_engine("glm")

## Combine in workflow
vote_wf <- workflow() %>%
    add_recipe(vote_recipe) %>%
    add_model(glm_spec)

## Final fit
vote_final <- vote_wf %>%
    last_fit(vote_split)

## Confusion matrix
vote_final %>% 
    collect_predictions() %>% 
    conf_mat(turnout16_2016, .pred_class)
