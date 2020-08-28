library(tidyverse)
cars2018 <- read_csv("data/cars2018.csv")

# Deselect the 2 columns to create cars_vars
car_vars <- cars2018 %>%
    ___(-model, -model_index)

# Fit a linear model
fit_all <- ___(___ ~ ., data = ___)

# Print the summary of the model
___(fit_all)


