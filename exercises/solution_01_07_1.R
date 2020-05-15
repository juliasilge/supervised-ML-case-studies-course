car_train <- readRDS("data/c1_train.rds")
car_test <- readRDS("data/c1_test.rds")

# Load tidymodels
library(tidymodels)

# Build a linear regression model specification
lm_mod <- linear_reg() %>%
    set_engine("lm")

# Train a linear regression model
fit_lm <- lm_mod %>%
    fit(log(MPG) ~ ., 
        data = car_train)

# Print the model object
fit_lm
