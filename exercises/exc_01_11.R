library(tidymodels)

car_train <- readRDS("data/c1_train_10_percent.rds")

lm_mod <- linear_reg() %>%
    set_engine("lm")

rf_mod <- rand_forest() %>%
    set_engine("randomForest") %>%
    set_mode("regression")

## Create bootstrap resamples
car_boot <- ___(car_train)

# Evaluate the models with bootstrap resampling
lm_res <- ___ %>%
    fit_resamples(
        log(MPG) ~ .,
        resamples = ___,
        control = control_resamples(save_pred = TRUE)
    )

rf_res <- ___ %>%
    fit_resamples(
        log(MPG) ~ .,
        resamples = ___,
        control = control_resamples(save_pred = TRUE)
    )

glimpse(rf_res)
