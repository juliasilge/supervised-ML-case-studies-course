library(tidyverse)
stack_overflow <- read_csv("data/stack_overflow.csv")

# Take a look at stack_overflow
glimpse(___)

# First count for `remote`
stack_overflow %>% 
    count(___, sort = TRUE)

# then count for `country`
stack_overflow %>% 
    ___(___, sort = TRUE)
