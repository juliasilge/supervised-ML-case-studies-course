library(tidyverse)
library(arrow)
cars2018 <- read_parquet("data/cars2018.parquet")

# Print the cars2018 object
glimpse(___)

# Plot the histogram
ggplot(cars2018, aes(x = ___)) +
    geom_histogram(bins = 25) +
    labs(___ = "Fuel efficiency (mpg)",
         ___ = "Number of cars")

