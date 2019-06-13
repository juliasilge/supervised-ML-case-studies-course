# Overall agreement with all questions varied by age
tidy_sisters %>%
    group_by(age) %>%
    summarize(value = mean(value, na.rm = TRUE))

# Number of respondents agreed or disagreed overall
tidy_sisters %>%
    count(value)