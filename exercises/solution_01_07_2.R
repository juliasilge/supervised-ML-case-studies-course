library(tidymodels)
library(arrow)
car_train <- read_parquet("data/c1_train.parquet")
car_test <- read_parquet("data/c1_test.parquet")

# Build a random forest model specification
rf_mod <- rand_forest() %>%
    set_engine("randomForest") %>%
    set_mode("regression")

# Train a random forest model
fit_rf <- rf_mod %>%
    fit(log(mpg) ~ ., 
        data = car_train)

# Print the model object
fit_rf
