library(tidymodels)

tree_grid <- ___(num_comp(c(3, 12)),
                          cost_complexity(),
                          ___,
                          levels = 5)

glimpse(tree_grid)
