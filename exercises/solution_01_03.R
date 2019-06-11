library(tidyverse)
cars2018 <- read_csv("/usr/local/share/datasets/cars2018.csv")

# Print the cars2018 object
cars2018

# Plot the histogram
ggplot(cars2018, aes(x = MPG)) +
    geom_histogram(bins = 25) +
    labs(y = "Number of cars",
         x = "Fuel efficiency (mpg)")
