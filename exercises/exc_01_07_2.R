library(tidymodels)

car_train <- readRDS("data/c1_train.rds")
car_test <- readRDS("data/c1_test.rds")

# Build a random forest model specification
rf_mod <- ___ %>%
    set_engine("randomForest") %>%
    set_mode("regression")

# Train a random forest model
fit_rf <- rf_mod %>%
    ___(log(mpg) ~ ., 
        data = ___)

# Print the model object
fit_rf
