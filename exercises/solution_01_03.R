library(tidyverse)
cars2018 <- read_csv("data/cars2018.csv")

# Print the cars2018 object
glimpse(cars2018)

# Plot the histogram
ggplot(cars2018, aes(x = mpg)) +
    geom_histogram(bins = 25) +
    labs(x = "Fuel efficiency (mpg)",
         y = "Number of cars")
