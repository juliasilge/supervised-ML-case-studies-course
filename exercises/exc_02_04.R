library(tidyverse)
stackoverflow <- read_csv("/usr/local/share/datasets/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Build a simple logistic regression model
simple_glm <- stackoverflow %>%
        select(-___) %>%
        glm(___,
            family = "binomial",
            data = ___)

