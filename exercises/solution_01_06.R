library(tidyverse)
car_vars <- readRDS("data/c1_cars_vars_full.rds")

# Load rsample
library(rsample)

# Split the data into training and test sets
set.seed(1234)
car_split <- car_vars %>%
    initial_split(prop = 0.8, strata = `Transmission`)

car_train <- training(car_split)
car_test <- testing(car_split)

