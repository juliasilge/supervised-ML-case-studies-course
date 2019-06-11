library(caret)
library(tidyverse)

training <- readRDS("/usr/local/share/datasets/c1_training_full.rds")
fit_lm <- readRDS("/usr/local/share/datasets/c1_fit_lm.rds")
fit_rf <- readRDS("/usr/local/share/datasets/c1_fit_rf.rds")

# Load yardstick
library(___)

# Create the new columns
results <- training %>%
    mutate(`Linear regression` = predict(___, training),
           `Random forest` = predict(___, training))

# Evaluate the performance
metrics(results, truth = ___, estimate = `Linear regression`)
metrics(results, truth = ___, estimate = `Random forest`)

