library(tidyverse)
library(tidymodels)

tree_res <- readRDS("data/c4_tree_res.rds")

tree_metrics <- tree_res %>%
    ___ 

glimpse(tree_metrics)

tree_metrics %>%
    mutate(tree_depth = factor(tree_depth),
           num_comp = paste("num_comp =", num_comp),
           num_comp = fct_inorder(num_comp)) %>%
    ggplot(aes(___, mean, color = ___)) +
    geom_line(size = 1.5, alpha = 0.6) +
    geom_point(size = 2) +
    scale_x_log10() +
    facet_grid(.metric ~ num_comp, scales = "free")
