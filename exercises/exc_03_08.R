library(tidyverse)
voters_select <- read_csv("/usr/local/share/datasets/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
    select(-case_identifier)

# Load caret
___

# Split data into training and testing sets
set.seed(1234)
in_train <- ___(___, 
                p = ___, list = FALSE)
training <- ___
testing <- ___
