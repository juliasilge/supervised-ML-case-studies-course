library(tidyverse)
sisters67 <- read_csv("/usr/local/share/datasets/sisters.csv")
tidy_sisters <- readRDS("/usr/local/share/datasets/c4_tidy_sisters.rds")

# Visualize agreement with age
tidy_sisters %>%
    filter(key %in% paste0("v", 153:170)) %>%
    group_by(key, value) %>%
    summarise(age = mean(age, na.rm = TRUE)) %>%
    ggplot(aes(value, age, color = key)) +
    geom_line(show.legend = FALSE) +
    facet_wrap(~key, nrow = 3)