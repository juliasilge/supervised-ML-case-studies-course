library(tidyverse)
sisters_select <- read_csv("/usr/local/share/datasets/sisters.csv") %>%
    select(-sister)
library(caret)

# Split the data into training and validation/test sets
set.seed(1234)
in_train <- createDataPartition(sisters_select$age, 
                                p = 0.6, list = FALSE)
training <- sisters_select[in_train, ]
validation_test <- sisters_select[-in_train, ]

# Split the validation and test sets
set.seed(1234)
in_test <- createDataPartition(validation_test$age, 
                               p = 0.5, list = FALSE)
testing <- validation_test[in_test, ]
validation <- validation_test[-in_test, ]