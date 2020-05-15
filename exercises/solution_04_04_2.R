library(tidyverse)
tidy_sisters <- readRDS("data/tidy_sisters.rds")

# Overall agreement with all questions varied by age
tidy_sisters %>%
    group_by(age) %>%
    summarize(rating = mean(rating, na.rm = TRUE))

# Number of respondents agreed or disagreed overall
tidy_sisters %>%
    count(rating)
