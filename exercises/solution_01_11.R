library(tidymodels)

car_train <- readRDS("data/c1_train_10_percent.rds")

lm_mod <- linear_reg() %>%
    set_engine("lm")

rf_mod <- rand_forest() %>%
    set_engine("randomForest") %>%
    set_mode("regression")

## Create bootstrap resamples
car_boot <- bootstraps(car_train)

# Evaluate the models with bootstrap resampling
lm_res <- lm_mod %>%
    fit_resamples(
        log(mpg) ~ .,
        resamples = car_boot,
        control = control_resamples(save_pred = TRUE)
    )

rf_res <- rf_mod %>%
    fit_resamples(
        log(mpg) ~ .,
        resamples = car_boot,
        control = control_resamples(save_pred = TRUE)
    )

glimpse(rf_res)
