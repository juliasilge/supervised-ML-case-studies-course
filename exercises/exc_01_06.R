library(tidyverse)
car_vars <- readRDS("/usr/local/share/datasets/c1_cars_vars_full.rds")

# Load rsample
___

# Split the data into training and test sets
set.seed(1234)
car_split <- car_vars %>%
    initial_split(prop = ___, strata = "___")

car_train <- training(___)
car_test <- testing(___)



