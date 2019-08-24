
library(tidyverse)

results %>%
    gather(Method, Result, `Linear regression`:`Random forest`) %>%
    ggplot(aes(log(MPG), Result, color = Method)) +
    geom_point(size = 1.5, alpha = 0.5) +
    facet_wrap(~Method) +
    geom_abline(lty = 2, color = "gray50") +
    geom_smooth(method = "lm")

