library(tidyverse)
sisters67 <- read_csv("data/sisters.csv")

# Load tidyverse
___

# View sisters67
glimpse(___)

# Plot the histogram
ggplot(sisters67, aes(x = ___)) +
    ___(binwidth = 10)
