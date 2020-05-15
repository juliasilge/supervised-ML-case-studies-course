library(tidyverse)
voters_select <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
    select(-case_identifier)

# Load tidymodels
library(tidymodels)

# Split data into training and testing sets
set.seed(1234)
vote_split <- voters_select %>%
    initial_split(p = 0.8,
                  strata = turnout16_2016)
vote_train <- training(vote_split)
vote_test <- testing(vote_split)

glimpse(vote_train)
glimpse(vote_test)
