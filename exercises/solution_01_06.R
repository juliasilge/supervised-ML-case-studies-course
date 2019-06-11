library(tidyverse)
cars_vars <- readRDS("/usr/local/share/datasets/c1_cars_vars_full.rds")

# Load caret
library(caret)

# Split the data into training and test sets
set.seed(1234)
in_train <- createDataPartition(cars_vars$Transmission, p = 0.8, list = FALSE)
training <- cars_vars[in_train, ]
testing <- cars_vars[-in_train, ]