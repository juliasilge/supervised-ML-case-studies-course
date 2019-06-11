library(tidyverse)
cars_vars <- readRDS("/usr/local/share/datasets/c1_cars_vars_full.rds")

# Load caret
___

# Split the data into training and test sets
set.seed(1234)
in_train <- createDataPartition(cars_vars$___, p = ___, list = FALSE)
training <- cars_vars[___, ]
testing <- cars_vars[___, ]



