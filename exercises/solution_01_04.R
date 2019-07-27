library(tidyverse)
cars2018 <- read_csv("/usr/local/share/datasets/cars2018.csv")

# Deselect the 2 columns to create cars_vars
car_vars <- cars2018 %>%
    select(-Model, -`Model Index`)

# Fit a linear model
fit_all <- lm(MPG ~ ., data = car_vars)

# Print the summary of the model
summary(fit_all)