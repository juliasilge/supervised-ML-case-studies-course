library(tidyverse)
cars2018 <- read_csv("/usr/local/share/datasets/cars2018.csv")

# Deselect the 2 columns to create cars_vars
cars_vars <- cars2018 %>%
    ___(-Model, -`Model Index`)

# Fit a linear model
fit_all <- ___(___ ~ ., data = ___)

# Print the summary of the model
___(fit_all)


