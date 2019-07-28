library(tidyverse)
tidy_sisters <- readRDS("/usr/local/share/datasets/c4_tidy_sisters.rds")

# Overall agreement with all questions by age
tidy_sisters %>%
    ___(age) %>%
    ___(value = mean(value, na.rm = TRUE))

# Number of respondents agreed or disagreed overall
tidy_sisters %>%
    ___(value)
