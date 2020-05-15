library(tidymodels)

glm_res <- readRDS("data/c3_glm_res.rds")
rf_res <- readRDS("data/c3_rf_res.rds")

collect_metrics(glm_res)
collect_metrics(rf_res)
