library(tidyverse)
library(caret)

vote_train <- readRDS("data/c3_training_full.rds")

# Perform logistic regression with upsampling and no resampling
vote_glm <- train(turnout16_2016 ~ ., 
                  method = "glm", family = "binomial",
                  data = vote_train,
                  trControl = ___(method = ___,
                                           ___))

