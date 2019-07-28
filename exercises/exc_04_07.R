library(tidyverse)
sisters67 <- read_csv("/usr/local/share/datasets/sisters.csv")

# Remove the sister column
sisters_select <- sisters67 %>% 
    ___(-sister)

# Build a simple linear regression model
simple_lm <- lm(___, 
                data = sisters_select)

# Print the summary of the model
___(simple_lm)