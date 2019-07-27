library(tidyverse)
stackoverflow <- read_csv("/usr/local/share/datasets/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Load rsample
library(rsample)

# Create stack_select dataset
stack_select <- stackoverflow %>%
    select(-Respondent)

# Split the data into training and testing sets
set.seed(1234)
stack_split <- stackoverflow %>%
    initial_split(p = 0.8,
                  strata = "Remote")

stack_train <- training(stack_split)
stack_test <- testing(stack_split)
