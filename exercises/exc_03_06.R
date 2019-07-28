library(tidyverse)
voters <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016))

# Remove the case_indetifier column
voters_select <- voters %>%
        ___(-case_identifier)

# Build a simple logistic regression model
simple_glm <- glm(___,  family = ___, 
                  data = voters_select)

# Print the summary                  
___(simple_glm)

