library(tidyverse)
tidy_sisters <- readRDS("data/tidy_sisters.rds")

# Visualize agreement with age
tidy_sisters %>%
    filter(question %in% paste0("v", 153:170)) %>%
    ___(question, rating) %>%
    ___(age = mean(age, na.rm = TRUE)) %>%
    ggplot(aes(rating, age, color = question)) +
    ___(show.legend = FALSE) +
    facet_wrap(~question, nrow = 3)
