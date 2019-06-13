library(tidyverse)
library(caret)

training <- readRDS("/usr/local/share/datasets/c3_training_full.rds")

# Perform logistic regression with upsampling and no resampling
vote_glm <- train(turnout16_2016 ~ ., method = "glm", family = "binomial",
                  data = training,
                  trControl = trainControl(method = "none",
                                           sampling = "up"))