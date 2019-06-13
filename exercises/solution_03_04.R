library(tidyverse)
voters <- read_csv("/usr/local/share/datasets/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016))

## Visualize difference by voter turnout
voters %>%
    ggplot(aes(econtrend_2016, ..density.., fill = turnout16_2016)) +
    geom_histogram(alpha = 0.5, position = "identity", binwidth = 1) +
    labs(title = "Overall, is the economy getting better or worse?")