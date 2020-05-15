library(tidymodels)

tree_grid <- grid_regular(num_comp(c(3, 12)),
                          cost_complexity(),
                          tree_depth(),
                          levels = 5)

glimpse(tree_grid)
