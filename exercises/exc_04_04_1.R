library(tidyverse)
sisters67 <- read_csv("/usr/local/share/datasets/sisters.csv")
tidy_sisters <- readRDS("/usr/local/share/datasets/c4_tidy_sisters.rds")

# Print the structure of sisters67
glimpse(sisters67)

# Tidy the data set
tidy_sisters <- sisters67 %>%
    select(-sister) %>%
    ___(key, value, -age)

# Print the structure of tidy_sisters
___
