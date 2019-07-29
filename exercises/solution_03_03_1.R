# Load tidyverse
library(tidyverse)

voters <- read_csv("data/voters.csv")

# Print voters
voters

# How many people voted?
voters %>%
    count(turnout16_2016)