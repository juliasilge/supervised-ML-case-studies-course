library(tidymodels)

lm_res <- readRDS("data/c1_lm_res.rds")
rf_res <- readRDS("data/c1_rf_res.rds")

results <-  bind_rows(___ %>%
                          collect_predictions() %>%
                          mutate(model = "lm"),
                      ___ %>%
                          collect_predictions() %>%
                          mutate(model = "rf"))

glimpse(results)
