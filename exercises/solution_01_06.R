library(arrow)
car_vars <- read_parquet("data/c1_car_vars.parquet")

# Load tidymodels
library(tidymodels)

# Split the data into training and test sets
set.seed(1234)
car_split <- car_vars %>%
    initial_split(prop = 0.8, strata = transmission)

car_train <- training(car_split)
car_test <- testing(car_split)

glimpse(car_train)
glimpse(car_test)
