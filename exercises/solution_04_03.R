library(tidyverse)
sisters67 <- read_csv("data/sisters.csv")

# Load tidyverse
library(tidyverse)

# View sisters67
glimpse(sisters67)

# Plot the histogram
ggplot(sisters67, aes(x = age)) +
    geom_histogram(binwidth = 10)