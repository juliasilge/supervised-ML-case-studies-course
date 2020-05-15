library(tidyverse)
tidy_sisters <- readRDS("data/tidy_sisters.rds")

# Overall agreement with all questions by age
tidy_sisters %>%
    ___(age) %>%
    ___(rating = mean(rating, na.rm = TRUE))

# Number of respondents agreed or disagreed overall
tidy_sisters %>%
    ___(rating)
