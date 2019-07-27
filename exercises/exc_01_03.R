library(tidyverse)
cars2018 <- read_csv("/usr/local/share/datasets/cars2018.csv")

# Print the cars2018 object
___

# Plot the histogram
ggplot(cars2018, aes(x = ___)) +
    geom_histogram(bins = 25) +
    labs(___ = "Fuel efficiency (mpg)",
         ___ = "Number of cars")

