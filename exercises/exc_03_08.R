library(tidyverse)
voters_select <- read_csv("/usr/local/share/datasets/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
    select(-case_identifier)

# Load rsample
___

# Split data into training and testing sets
set.seed(1234)
vote_split <- ___ %>%
    ___(p = ___,
                  strata = "___")
vote_train <- ___
vote_test <- ___
