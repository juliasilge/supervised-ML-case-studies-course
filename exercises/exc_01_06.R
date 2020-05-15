car_vars <- readRDS("data/c1_car_vars.rds")

# Load tidymodels
___

# Split the data into training and test sets
set.seed(1234)
car_split <- car_vars %>%
    initial_split(prop = ___, strata = ___)

car_train <- training(___)
car_test <- testing(___)

glimpse(car_train)
glimpse(car_test)
