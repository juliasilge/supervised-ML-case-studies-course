library(tidyverse)
stackoverflow <- read_csv("/usr/local/share/datasets/stackoverflow.csv")

# Print stackoverflow
stackoverflow

# First count for Remote
stackoverflow %>% 
    count(Remote, sort = TRUE)

# then count for Country
stackoverflow %>% 
    count(Country, sort = TRUE)