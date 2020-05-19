# load libraries ----
library(tidyverse)
library(tidymodels)
library(janitor)
library(tidyquant)

# load data ----
cars2018 <- read_csv('data/cars2018.csv')
cars2018 %>% head()

names(cars2018)
cars2018 %>% 
    select('Fuel injection')

cars2018 <- cars2018 %>% clean_names()
cars2018 %>% select('fuel_injection')

# EDA ----
cars2018 %>%
    ggplot(aes(x=mpg)) +
    geom_histogram(fill='steelblue', color='white',bins=50) +
    theme_bw() +
    labs(title = 'Fuel Efficiency - 2018',
             x = 'MPG',
             y = '')


# Simple Linear Regression ----
lm_data <- cars2018 %>%
    select(-c('model', 'model_index')) 

linear_model <- lm(mpg ~ ., data=lm_data) 
summary(linear_model)
