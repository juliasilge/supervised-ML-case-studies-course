library(tidymodels)

vote_train <- readRDS("data/c3_train.rds")

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016)

vote_recipe
