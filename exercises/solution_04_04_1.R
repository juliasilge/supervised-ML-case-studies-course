library(tidyverse)
sisters67 <- read_csv("/usr/local/share/datasets/sisters.csv")

# Print the structure of sisters67
glimpse(sisters67)

# Tidy the data set
tidy_sisters <- sisters67 %>%
    select(-sister) %>%
    gather(key, value, -age)

# Print the structure of tidy_sisters
glimpse(tidy_sisters)