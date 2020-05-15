library(tidyverse)
stack_overflow <- read_csv("data/stack_overflow.csv") %>%
    mutate(remote = factor(remote, levels = c("Remote", "Not remote"))) %>%
    mutate_if(is.character, factor)

# Load tidymodels
library(tidymodels)

# Create stack_select dataset
stack_select <- stack_overflow %>%
    select(-respondent)

# Split the data into training and testing sets
set.seed(1234)
stack_split <- stack_select %>%
    initial_split(p = 0.8,
                  strata = remote)

stack_train <- training(stack_split)
stack_test <- testing(stack_split)

glimpse(stack_train)
glimpse(stack_test)
