library(tidyverse)
voters <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016))

# Remove the case_indetifier column
voters_select <- voters %>%
        select(-case_identifier)

# Build a simple logistic regression model
simple_glm <- glm(turnout16_2016 ~ .,  family = "binomial", 
                  data = voters_select)

# Print the summary                  
summary(simple_glm)