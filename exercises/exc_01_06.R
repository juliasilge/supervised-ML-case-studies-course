library(tidyverse)
cars_vars <- readRDS("/usr/local/share/datasets/c1_cars_vars_full.rds")

# Load rsample
___

# Split the data into training and test sets
set.seed(1234)
in_train <- car_vars %>%
    initial_split(prop = ___, strata = "___")

car_train <- training()
car_test <- testing()



