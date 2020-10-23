library(tidymodels)
library(themis)

vote_train <- readRDS("data/c3_train.rds")

vote_recipe <- ___(turnout16_2016 ~ ., data = ___) %>% 
    ___(turnout16_2016)

vote_recipe
