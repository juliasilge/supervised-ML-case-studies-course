library(tidyverse)
tidy_sisters <- readRDS("/usr/local/share/datasets/c4_tidy_sisters.rds")

# Visualize agreement with age
tidy_sisters %>%
    filter(key %in% paste0("v", 153:170)) %>%
    ___(key, value) %>%
    ___(age = mean(age, na.rm = TRUE)) %>%
    ggplot(aes(value, age, color = key)) +
    ___(show.legend = FALSE) +
    facet_wrap(~key, nrow = 3)
