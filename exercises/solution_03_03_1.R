# Load tidyverse
library(tidyverse)

# Print voters
voters

# How many people voted?
voters %>%
    count(turnout16_2016)