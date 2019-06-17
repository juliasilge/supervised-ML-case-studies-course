---
type: slides
---

# Getting started with caret

Notes: You just performed some exploratory data analysis and built a simple linear model using base R's `lm()` function.


---

# Predicting fuel efficiency

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/histogram.png?raw=true)

Notes: You were able to see how the fuel efficiency for these cars is distributed and to get an idea about whether you will be able to train accurate models. Now it's time to bring out a more powerful and flexible set of tools for predictive modeling. 

---

# Tools for predictive modeling

### the [tidymodels](https://github.com/tidymodels/tidymodels) metapackage

### the [caret](https://topepo.github.io/caret/index.html) package

Notes: We are going to use packages from the tidymodels toolkit, as well as the caret package, in this course and the first thing we are going to practice is splitting your data into a training set and a testing set.

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/testtrain.png?raw=true)

Notes: It is best practice to hold out some of your data for **testing** in order to get a better estimate of how your models will perform on new data, especially when you use very powerful machine learning techniques. Linear regression doesn't really fall into that category, but we are going to practice this anyway. The tidymodels package [rsample](https://tidymodels.github.io/rsample/) has functions that help you specify training and testing sets.

---

# Training data and testing data with [rsample](https://tidymodels.github.io/rsample/)

```out
> library(rsample)
> 
> car_split <- car_vars %>%
+    initial_split(prop = 0.8,
+                  strata = "Aspiration")
+
> car_training <- training(car_split)
> car_testing <- testing(car_split)
```

Notes: You can create these sets so that they balance some characteristic in your dataset. For example, the code here takes an input data set and puts 80% of it into a training dataset and 20% of it into a testing dataset; it chooses the individual cases so that both sets are balanced in aspiration types.

---

# Training data and testing data

- **Build** your model with your training data 
- **Choose** your model with your validation data 
- **Evaluate** your model with your testing data 

Notes:  Why are we even bothering with this? 

The point of holding data back from the model training process is to have something to test that model on. We want to be able to estimate how well our model will perform on new data, and the best way to do that is to use data that was not an input to training the model at all. Holding out testing data allows you to assess if your model is overfitting. 

It's also possible to divide your data into *three* partitions as you build, choose, and assess models, and we'll talk about this later in the course.

---

# Training a model

```out
> fit_lm <- train(log(MPG) ~ ., 
+                 method = "lm", 
+                 data = car_training,
+                 trControl = trainControl(method = "none"))

```

- Train a model
- Evaluate that model using [yardstick](https://tidymodels.github.io/yardstick/)

Notes: Once you have a training dataset, you can train a model using that dataset! 

In caret, you specify models using the `train()` function, with details of what kind of model it is, and in what way you want to train it. 

We're going to start with `method = "none"` in `trainControl()`, as you see here. This means we're telling caret, "Just train the model one time, on the whole training set". Once your model is trained, you can evaluate how well the model is performing. 

---

# Evaluating a model


### the [yardstick](https://tidymodels.github.io/yardstick/) package


Notes:  In this course, we're going to use tidymodels package [yardstick](https://tidymodels.github.io/yardstick/) package for that. Functions from this package will give us metrics to measure how well our models are doing.

---

# Let's practice!

Notes: OK, it's time! Let's try some examples where you train a linear regression model and random forest model on our fuel efficiency data.












