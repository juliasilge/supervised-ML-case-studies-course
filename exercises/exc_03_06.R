library(tidyverse)
voters_select <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
    select(-case_identifier)

# Load tidymodels
___

# Split data into training and testing sets
set.seed(1234)
vote_split <- ___ %>%
    ___(p = ___,
                  strata = ___)
vote_train <- ___
vote_test <- ___

glimpse(vote_train)
glimpse(vote_test)
