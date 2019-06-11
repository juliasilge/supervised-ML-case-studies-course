library(tidyverse)
stackoverflow <- read_csv("/usr/local/share/datasets/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Load caret
library(caret)

# Create stack_select dataset
stack_select <- stackoverflow %>%
    select(-Respondent)

# Split the data into training and testing sets
set.seed(1234)
in_train <- createDataPartition(stack_select$Remote, p = .8, list = FALSE)
training <- stack_select[in_train,]
testing <- stack_select[-in_train,]