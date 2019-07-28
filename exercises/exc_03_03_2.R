library(tidyverse)
voters <- read_csv("/usr/local/share/datasets/voters.csv")

# How do the reponses on the survey vary with voting behavior?
voters %>%
    ___(turnout16_2016) %>%
    ___(`Elections don't matter` = mean(RIGGED_SYSTEM_1_2016 <= 2),
              `Economy is getting better` = mean(econtrend_2016 == 1),
              `Crime is very important` = mean(imiss_a_2016 == 2))


