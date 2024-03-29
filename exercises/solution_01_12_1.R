library(tidymodels)

lm_res <- readRDS("data/c1_lm_res.rds")
rf_res <- readRDS("data/c1_rf_res.rds")

results <-  bind_rows(lm_res %>%
                          collect_predictions() %>%
                          mutate(model = "lm"),
                      rf_res %>%
                          collect_predictions() %>%
                          mutate(model = "rf"))

glimpse(results)
