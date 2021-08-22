library(tidymodels)
library(themis)

vote_train <- readRDS("data/c3_train_10_percent.rds")

vote_folds <- vfold_cv(vote_train, v = 10)

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016)

glm_spec <- logistic_reg() %>%
    set_engine("glm")

vote_wf <- workflow() %>%
    add_recipe(vote_recipe) %>%
    add_model(glm_spec)

set.seed(234)
glm_res <- vote_wf %>%
    fit_resamples(
        vote_folds,
        metrics = metric_set(roc_auc, sensitivity, specificity),
        control = control_resamples(save_pred = TRUE)
    )

glimpse(glm_res)
