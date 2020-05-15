library(tidyverse)
stack_overflow <- read_csv("data/stack_overflow.csv")

ggplot(stack_overflow, aes(remote, years_coded_job)) +
    geom_boxplot() +
    labs(x = NULL,
         y = "Years of professional coding experience")
