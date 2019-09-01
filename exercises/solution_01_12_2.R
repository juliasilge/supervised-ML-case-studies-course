library(tidyverse)

results <- car_test %>%
    mutate(`Linear regression` = predict(cars_lm_bt, car_test),
           `Random forest` = predict(cars_rf_bt, car_test))

results %>%
    gather(Method, Result, `Linear regression`:`Random forest`) %>%
    ggplot(aes(log(MPG), Result, color = Method)) +
    geom_point(size = 1.5, alpha = 0.5) +
    facet_wrap(~Method) +
    geom_abline(lty = 2, color = "gray50") +
    geom_smooth(method = "lm")
