library(tidyverse)
stackoverflow <- read_csv("/usr/local/share/datasets/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Build a simple logistic regression model
simple_glm <- stackoverflow %>%
        select(-Respondent) %>%
        glm(Remote ~ .,
            family = "binomial",
            data = .)

# Print the summary of the model
summary(simple_glm)