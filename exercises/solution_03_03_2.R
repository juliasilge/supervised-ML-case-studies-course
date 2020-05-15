library(tidyverse)
voters <- read_csv("data/voters.csv")

# How do the responses on the survey vary with voting behavior?
voters %>%
    group_by(turnout16_2016) %>%
    summarise(`Elections don't matter` = mean(RIGGED_SYSTEM_1_2016 <= 2),
              `Economy is getting better` = mean(econtrend_2016 == 1),
              `Crime is very important` = mean(imiss_a_2016 == 2))