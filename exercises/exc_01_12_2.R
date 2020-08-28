library(tidymodels)

lm_res <- readRDS("data/c1_lm_res.rds")
rf_res <- readRDS("data/c1_rf_res.rds")

results <-  bind_rows(lm_res %>%
                          collect_predictions() %>%
                          mutate(model = "lm"),
                      rf_res %>%
                          collect_predictions() %>%
                          mutate(model = "rf"))

results %>%
    ggplot(aes(`log(mpg)`, .pred)) +
    geom_abline(lty = 2, color = "gray50") +
    geom_point(aes(color = id), size = 1.5, alpha = 0.3, show.legend = FALSE) +
    geom_smooth(method = "lm") +
    facet_wrap(~ model)
