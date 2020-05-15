library(tidyverse)
voters <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016))

## Visualize difference by voter turnout
voters %>%
    ___(aes(econtrend_2016, after_stat(density), fill = turnout16_2016)) +
    ___(alpha = 0.5, position = "identity", binwidth = 1) +
    labs(title = "Overall, is the economy getting better or worse?")

