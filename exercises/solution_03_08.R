library(tidyverse)
voters_select <- read_csv("/usr/local/share/datasets/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
    select(-case_identifier)

# Load caret
library(caret)

# Split data into training and testing sets
set.seed(1234)
in_train <- createDataPartition(voters_select$turnout16_2016, 
                                p = 0.8, list = FALSE)
training <- voters_select[in_train, ]
testing <- voters_select[-in_train, ]