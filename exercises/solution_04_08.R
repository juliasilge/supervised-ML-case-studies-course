library(tidyverse)
library(rsample)
sisters_select <- read_csv("data/sisters.csv") %>%
    select(-sister)

# Split the data into training and validation/test sets
train_split <- sisters_select %>%
    initial_split(prop = 0.6,
                  strata = "age")

sisters_train <- training(train_split)
validate_test <- testing(train_split)

# Split the validation and test sets
set.seed(1234)
validation_split <- validate_test %>%
    initial_split(prop = 0.5,
                  strata = "age")

sisters_validate <- training(validation_split)
sisters_test <- testing(validation_split)
