library(tidyverse)
stack_overflow <- read_csv("data/stack_overflow.csv")

# Take a look at stack_overflow
glimpse(stack_overflow)

# First count for `remote`
stack_overflow %>% 
    count(remote, sort = TRUE)

# then count for `country`
stack_overflow %>% 
    count(country, sort = TRUE)
