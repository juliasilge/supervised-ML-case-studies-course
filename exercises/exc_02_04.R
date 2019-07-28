library(tidyverse)
stackoverflow <- read_csv("data/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Build a simple logistic regression model
simple_glm <- stackoverflow %>%
        select(-___) %>%
        glm(___,
            family = "binomial",
            data = ___)


# Print the summary of the model
summary(simple_glm)
