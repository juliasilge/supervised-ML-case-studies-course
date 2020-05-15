library(tidyverse)
library(tidymodels)
sisters_select <- read_csv("data/sisters.csv") %>%
    select(-sister)

# Split off the testing set
set.seed(123)
sisters_split <- initial_split(sisters_select, strata = age)

sisters_other <- training(sisters_split)
sisters_test <- testing(sisters_split)

# Create the validation split
set.seed(123)
sisters_val <- validation_split(sisters_other, strata = age)

glimpse(sisters_val)
