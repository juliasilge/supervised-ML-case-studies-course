library(arrow)
car_train <- read_parquet("data/c1_train.parquet")
car_test <- read_parquet("data/c1_test.parquet")

# Load tidymodels
___

# Build a linear regression model specification
lm_mod <- ___ %>%
    set_engine("lm")

# Train a linear regression model
fit_lm <- lm_mod %>%
    fit(log(mpg) ~ ., 
        data = ___)

# Print the model object
fit_lm
