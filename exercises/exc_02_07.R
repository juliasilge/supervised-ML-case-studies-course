library(tidyverse)
library(caret)

stack_train <- readRDS("/usr/local/share/datasets/c2_training_full.rds")
stack_test <- readRDS("/usr/local/share/datasets/c2_testing_full.rds")

# Create the upsampled training set
up_train <- upSample(x = select(___, -Remote),
                     y = ___,
                     yname = "___") %>%
    as_tibble()

# Count the number of each type of Remote employee
up_train %>%
    count(Remote)

