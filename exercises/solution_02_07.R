library(tidyverse)
library(caret)

training <- readRDS("/usr/local/share/datasets/c2_training_full.rds")
testing <- readRDS("/usr/local/share/datasets/c2_testing_full.rds")

# Create the upsampled training set
up_train <- upSample(x = select(training, -Remote),
                     y = training$Remote,
                     yname = "Remote") %>%
    as_tibble()

# Count the number of each type of Remote employee
up_train %>%
    count(Remote)