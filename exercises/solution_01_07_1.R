library(arrow)
car_train <- read_parquet("data/c1_train.parquet")
car_test <- read_parquet("data/c1_test.parquet")

# Load tidymodels
library(tidymodels)

# Build a linear regression model specification
lm_mod <- linear_reg() %>%
    set_engine("lm")

# Train a linear regression model
fit_lm <- lm_mod %>%
    fit(log(mpg) ~ ., 
        data = car_train)

# Print the model object
fit_lm
