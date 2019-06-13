library(tidyverse)
sisters_select <- read_csv("/usr/local/share/datasets/sisters.csv") %>%
    select(-sister)
library(caret)

# Split the data into training and validation/test sets
set.seed(1234)
in_train <- ___(sisters_select$age, 
                                p = ___, list = FALSE)
training <- sisters_select[___, ]
validation_test <- sisters_select[___, ]

# Split the validation and test sets
set.seed(1234)
in_test <- ___(validation_test$age, 
                               p = ___, list = FALSE)
testing <- validation_test[___, ]
validation <- validation_test[___, ]

