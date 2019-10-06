library(tidyverse)
stackoverflow <- read_csv("data/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Load rsample
library(___)

# Create stack_select dataset
stack_select <- stackoverflow %>%
    select(-Respondent)

# Split the data into training and testing sets
set.seed(1234)
stack_split <- stack_select %>%
    initial_split(___,
                  strata = "___")

stack_train <- training(___)
stack_test <- testing(___)


