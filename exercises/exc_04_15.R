library(tidyverse)
library(tidymodels)

sisters_select <- read_csv("data/sisters.csv") %>%
    select(-sister)
final_wf <- readRDS("data/c4_final_wf.rds")

set.seed(123)
sisters_split <- initial_split(sisters_select, strata = age)

final_tree <- final_wf %>%
    ___(sisters_split) 

final_tree %>%
    ___
