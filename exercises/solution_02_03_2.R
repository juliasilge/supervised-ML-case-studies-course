library(tidyverse)
stackoverflow <- read_csv("data/stackoverflow.csv")

ggplot(stackoverflow, aes(Remote, YearsCodedJob)) +
    geom_boxplot() +
    labs(x = NULL,
         y = "Years of professional coding experience")
