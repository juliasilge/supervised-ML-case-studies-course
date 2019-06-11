library(tidyverse)
stackoverflow <- read_csv("/usr/local/share/datasets/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Load caret
library(___)

# Create stack_select dataset
stack_select <- stackoverflow %>%
    select(-Respondent)

# Split the data into training and testing sets
set.seed(1234)
in_train <- createDataPartition(___, ___, list = FALSE)
training <- stack_select[___,]
testing <- stack_select[___,]

