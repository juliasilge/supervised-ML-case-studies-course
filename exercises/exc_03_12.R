library(tidymodels)

vote_train <- readRDS("data/c3_train.rds")

vote_folds <- vfold_cv(vote_train, ___ = 10, ___ = 5)

glimpse(vote_folds)
