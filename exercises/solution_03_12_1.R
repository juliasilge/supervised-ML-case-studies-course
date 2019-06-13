library(tidyverse)
library(caret)

training <- readRDS("/usr/local/share/datasets/c3_training_two_percent.rds")

# Logistic regression
vote_glm <- train(turnout16_2016 ~ ., method = "glm", family = "binomial",
                  data = training,
                  trControl = trainControl(method = "repeatedcv",
                                           repeats = 2,
                                           sampling = "up"))

# Print vote_glm
vote_glm