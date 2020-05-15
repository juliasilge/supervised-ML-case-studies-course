library(tidyverse)
library(tidymodels)
sisters_select <- read_csv("data/sisters.csv") %>%
    select(-sister)

# Split off the testing set
set.seed(123)
sisters_split <- ___(sisters_select, strata = age)

sisters_other <- training(___)
sisters_test <- testing(___)

# Create the validation split
set.seed(123)
sisters_val <- ___(sisters_other, strata = age)

glimpse(sisters_val)
