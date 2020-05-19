library(tidymodels)

cars_data <- lm_data

cars_split <- cars_data %>%
    initial_split(prop = 0.8, strata = aspiration)

car_train <- training(cars_split)
car_test <- testing(cars_split)

# linear regression model specification ----
lm_mod <- linear_reg() %>%
    set_engine("lm")

lm_fit <- lm_mod %>%
    fit(log(mpg) ~ .,
        data = car_train)


# random forest model specification
rf_mod <- rand_forest() %>%
    set_mode("regression") %>%
    set_engine("randomForest")

rf_fit <- rf_mod %>%
    fit(log(mpg) ~ .,
        data = car_train)


# 3 concepts in specifying a model
# 1. Model type
# 2. Model mode
# 3. Model engine

# evaluation model performance
results <- car_train %>%
    mutate(mpg = log(mpg)) %>%
    bind_cols(predict(lm_fit, car_train) %>%
                  rename(.pred_lm = .pred)) %>%
    bind_cols(predict(rf_fit, car_train) %>%
                  rename(.pred_rf = .pred))

metrics(results, truth = mpg, estimate = .pred_lm)
metrics(results, truth = mpg, estimate = .pred_rf)
