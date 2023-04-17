library(tidyverse)
library(arrow)
cars2018 <- read_parquet("data/cars2018.parquet")

# Deselect the 2 columns to create cars_vars
car_vars <- cars2018 %>%
    ___(-model, -model_index)

# Fit a linear model
fit_all <- ___(___ ~ ., data = ___)

# Print the summary of the model
___(fit_all)


