# Load tidyverse
library(tidyverse)

voters <- read_csv("data/voters.csv")

# Take a look at voters
glimpse(voters)

# How many people voted?
voters %>%
    count(turnout16_2016)