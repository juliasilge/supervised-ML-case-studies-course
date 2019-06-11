ggplot(stackoverflow, aes(Remote, YearsCodedJob)) +
    geom_boxplot() +
    labs(x = NULL,
         y = "Years of professional coding experience")