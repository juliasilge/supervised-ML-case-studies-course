---
type: slides
---

# Getting started with tidymodels 💫

Notes: You just performed some exploratory data analysis and built a simple linear model using base R's `lm()` function.


---

# Predicting fuel efficiency ⛽ 

![Histogram](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/mpg_histogram.png?raw=true)

Notes: You were able to see how the fuel efficiency for these cars is distributed and to get an idea about whether you will be able to train accurate models. Now it's time to bring out a more powerful and flexible set of tools for predictive modeling. 

---

# Tools for predictive modeling

![tidymodels](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/tidymodels_small.png?raw=true)

Learn more at [`tidymodels.org`](https://www.tidymodels.org/)!

Notes: We are going to use packages from tidymodels in this course. 

When you type `library(tidymodels)`, you load a collection of packages for modeling and machine learning using tidyverse principles. I usually just load them all at once if I am working on a modeling project. All the packages are designed to be consistent, modular, and to support good modeling practices. The first thing we are going to practice is splitting your data into a training set and a testing set.

---

![test train](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/testtrain.png?raw=true)

Notes: It is best practice to hold out some of your data for **testing** in order to get a better estimate of how your models will perform on new data, especially when you use very powerful machine learning techniques. Linear regression doesn't really fall into that category, but we are going to practice this anyway. The tidymodels package [rsample](https://tidymodels.github.io/rsample/) has functions that help you specify training and testing sets.

---

# Training data and testing data with [rsample](https://tidymodels.github.io/rsample/)

```r
library(tidymodels)
 
car_split <- car_vars %>%
    initial_split(prop = 0.8,
                  strata = Aspiration)

car_training <- training(car_split)
car_testing <- testing(car_split)
```

Notes: You can create these sets so that they balance some characteristic in your dataset. ⚖️ For example, the code here takes an input data set and puts 80% of it into a training dataset and 20% of it into a testing dataset; it chooses the individual cases so that both sets are balanced in aspiration types.

---

# Training data and testing data

- **Build** your model with your training data 
- **Choose** your model with your validation data, or resampled datasets 
- **Evaluate** your model with your testing data 

Notes:  Why are we even bothering with this? 

The point of holding data back from the model training process is to have something to test that model on. We want to be able to estimate how well our model will perform on new data, and the best way to do that is to use data that was not an input to training the model at all. Holding out testing data allows you to assess if your model is overfitting. 

It's also possible to divide your data into *three* partitions as you build, choose, and assess models, and we'll talk about this later in the course.

---

# Training a model

```r
library(tidymodels)

## a linear regression model specification
lm_mod <- linear_reg() %>%
    set_engine("lm")

lm_fit <- lm_mod %>%
    fit(log(MPG) ~ ., 
        data = car_train)

## a random forest model specification
rf_mod <- rand_forest() %>%
    set_mode("regression") %>%
    set_engine("randomForest")

fit_rf <- rf_mod %>%
    fit(log(MPG) ~ ., 
        data = car_train)        

```

#### Three concepts in specifying a model

- Model **type**
- Model **mode**
- Model **engine**

Notes: Once you have a training dataset, you can train a model using that dataset! 

In tidymodels, you specify models using three concepts. 

- Model **type** differentiates models such as logistic regression, decision tree models, and so forth. 
- Model **mode** includes common options like regression and classification; some model types support either of these while some only have one mode. (Notice in the example on this slide that we didn't need to set the mode for `linear_reg()` because it only does regression.)
- Model **engine** is the computational tool which will be used to fit the model. Often these are R packages, such as `"lm"` for OLS or the different implementations of random forest models.

After a model has been _specified_, it can be _fit_, typically using a symbolic description of the model (a formula) and some data. We're going to start fitting models with `data = car_train`, as shown here. This means we're saying, "Just fit the model one time, on the whole training set". Once you have fit your model, you can evaluate how well the model is performing. 

---

# Evaluating a model


### the [yardstick](https://tidymodels.github.io/yardstick/) package 📏


Notes:  In this course, we're going to use tidymodels package [yardstick](https://tidymodels.github.io/yardstick/) package for that. Functions from this package will give us metrics to measure how well our models are doing.

---

# Let's practice!

Notes: OK, it's time! Let's try some examples where you train a linear regression model and random forest model on our fuel efficiency data. ⛽ 












