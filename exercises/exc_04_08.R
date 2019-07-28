library(tidyverse)
library(rsample)
sisters_select <- read_csv("data/sisters.csv") %>%
    select(-sister)

# Split the data into training and validation/test sets
train_split <- sisters_select %>%
    ___(prop = 0.6,
                  strata = "age")

sisters_train <- training(___)
validate_test <- testing(___)

# Split the validation and test sets
set.seed(1234)
validation_split <- validate_test %>%
    ___(prop = 0.5,
                  strata = "age")

sisters_validate <- training(___)
sisters_text <- testing(___)
