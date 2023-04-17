---
title: 'Chapter 1: Not mtcars AGAIN'
description:
  'In this first case study, you will predict fuel efficiency from a US Department of Energy data set for real cars of today.'
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Make predictions using machine learning" type="slides">

<slides source="chapter1_01">
</slides>

</exercise>

<exercise id="2" title="Choose an appropriate model">

In this case study, you will predict the fuel efficiency ⛽  of modern cars from characteristics of these cars, like transmission and engine displacement. Fuel efficiency is a numeric value that ranges smoothly from about 15 to 40 miles per gallon. What kind of model will you build?

<choice>
<opt text="Summarization">

Summarization is not a type of supervised machine learning model we will cover in this course.

</opt>

<opt text="Clustering">

Clustering is an example of unsupervised machine learning, which we will not cover in this course.

</opt>

<opt text="Classification">

A classification model predicts a group membership or discrete class label, not a numeric/continuous value or response.

</opt>

<opt text="Regression" correct="true">

👏 To predict a continuous, numeric quantity like fuel efficiency, use regression models.

</opt>
</choice>

</exercise>

<exercise id="3" title="Visualize the fuel efficiency distribution">

The first step before you start modeling is to explore your data. In this course we'll practice using tidyverse functions for exploratory data analysis. Start off this case study by examining your data set and visualizing the distribution of fuel efficiency. The ggplot2 package, with functions like [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) and [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html), is included in the tidyverse.

**Instructions**

The first time you run a code exercise, it may take a little while for your Docker container on [mybinder.org](https://mybinder.org/v2/gh/juliasilge/supervised-ML-case-studies-course/binder) to load. ⏳ Try to be patient!

**Wherever you see `___` in a code exercise, replace it with the correct code as instructed. Run the code (via the button) to see if it will run, and submit it (via the other button) to check if it's correct.**

The tidyverse metapackage is loaded for you, so you can use ggplot2 and other functions for exploratory data analysis. The arrow package is also loaded, so you can read our data stored as a [Parquet](https://parquet.apache.org/) file. 

- Take a look at the `cars2018` object using `glimpse()`.
- Use the appropriate column from the data set in the call to `aes()` so you can plot a histogram of fuel efficiency (miles per gallon, `mpg`).
- Set the correct `x` and `y` labels.

<codeblock id="01_03">

- The column `mpg` contains the fuel efficiency measurements so to make the plot, call `aes(x = mpg)`.
- The number of cars goes on the y-axis and the fuel efficiency goes on the x-axis.

</codeblock>

</exercise>

<exercise id="4" title="Build a simple linear model">

Before embarking on more complex machine learning models, it's a good idea to build the simplest possible model to get an idea of what is going on. In this case, that means fitting a simple linear model using base R's `lm()` function.

**Instructions**

- Use [`select()`](https://dplyr.tidyverse.org/reference/select.html) to deselect the two columns `model` and `model_index` from the model; these columns tell us the individual identifiers for each car and it would *not* make sense to include them in modeling. 
- Fit `mpg` as the predicted quantity, explained by all the predictors, i.e., `.` in the R formula input to `lm()`. (You may have noticed the log distribution of MPG in the last exercise, but don't worry about fitting the logarithm of fuel efficiency yet.) 
- Print the `summary()` of the model.

<codeblock id="01_04">

- To deselect the `model` column, use `cars2018 %>% select(-model)`.

</codeblock>

</exercise>

<exercise id="5" title="Getting started with tidymodels" type="slides">

<slides source="chapter1_05">
</slides>

</exercise>

<exercise id="6" title="Training and testing data">

Training models based on all of your data at once is typically not a good choice. 🚫 Instead, you can create subsets of your data that you use for different purposes, such as *training* your model and then *testing* your model. 

Creating training/testing splits reduces overfitting. When you evaluate your model on data that it was not trained on, you get a better estimate of how it will perform on new data.

**Instructions**

- Load the `tidymodels` metapackage, which also includes dplyr for data manipulation. 
- Create a data split that divides the original data into 80%/20% sections and (roughly) evenly divides the partitions between the different types of `transmission`.
- Assign the 80% partition to `car_train` and the 20% partition to `car_test`.

<codeblock id="01_06">

- To load a package in R, use `library(package_name)`.
- `initial_split()` takes as its arguments, after the data that you pipe in: `prop`, the proportion of data to include in the training set, and then `strata`, the variable to partition evenly across.
- Once you create the `car_split` object, you can use it to determine your training set and testing set.

</codeblock>

</exercise>

<exercise id="7" title="Train models with tidymodels">

Now that your `car_train` data is ready, you can fit a set of models with tidymodels. When we model data, we deal with model **type** (such as linear regression or random forest), **mode** (regression or classification), and model **engine** (how the models are actually fit). In tidymodels, we capture that modeling information in a model specification, so setting up your model specification can be a good place to start. In these exercises, fit one linear regression model and one random forest model, without any resampling of your data.

**Instructions**

- Load the tidymodels metapackage. 
- Fit a basic linear regression model to your `car_train` data. 

(Notice that we are fitting to `log(mpg)` since the fuel efficiency had a log normal distribution.)

<codeblock id="01_07_1">

For linear regression, use the function `linear_reg()`.

</codeblock>

**Instructions**

- Fit a random forest model to your `car_train` data.

<codeblock id="01_07_2">

For a random forest model, use the function `rand_forest()`.

</codeblock>

</exercise>

<exercise id="8" title="Evaluate model performance">

The `fit_lm` and `fit_rf` models you just trained are in your environment. It's time to see how they did! 🤩 How are we doing do this, though?! 🤔 There are several things to consider, including both what _metrics_ and what _data_ to use.

For regression models, we will focus on evaluating using the **root mean squared error** metric. This quantity is measured in the same units as the original data (log of miles per gallon, in our case). Lower values indicate a better fit to the data. It's not too hard to calculate root mean squared error manually, but the [yardstick](https://tidymodels.github.io/yardstick/) package offers convenient functions for this and many other model performance metrics.

**Instructions**

- Load the tidymodels metapackage, to access yardstick functions. 
- Create new columns for model predictions from each of the models you have trained, first linear regression and then random forest.
- Evaluate the performance of these models using [`metrics()`](https://tidymodels.github.io/yardstick/reference/metrics.html) by specifying the column that contains the real fuel efficiency.

<codeblock id="01_08">

- Use `fit_lm` to predict the values for linear regression and `fit_rf` to predict values for random forest.
- The "truth" column in `results` is the column that holds fuel efficiency, `mpg`.

</codeblock>

</exercise>

<exercise id="9" title="Use the testing data">

"But wait!" you say, because you have been paying attention. 🤔 "That is how these models perform on the *training* data, the data that we used to build these models in the first place." This is _not_ a good idea because when you evaluate on the same data you used to train a model, the performance you estimate is too optimistic.

Let's evaluate how these simple models perform on the testing data instead.

**Instructions**

What do you need to change to evaluate how the models perform on the testing data, instead of the training data?

<codeblock id="01_09">

Where you had `car_train` before, switch out to `car_test`.

</codeblock>

</exercise>

<exercise id="10" title="Let's sample our data" type="slides">

<slides source="chapter1_10">
</slides>

</exercise>

<exercise id="11" title="Bootstrap resampling">

In the last set of exercises, you trained linear regression and random forest models without any resampling. Resampling can help us evaluate our machine learning models more accurately.

Let's try bootstrap resampling, which means creating data sets the same size as the original one by randomly drawing with replacement from the original. In tidymodels, the default behavior for bootstrapping is 25 resamplings, but you can change this using the `times` argument in [`bootstraps()`](https://tidymodels.github.io/rsample/reference/bootstraps.html) if desired.

**Instructions**

The data set available in your environment is 10% of its original size, to allow the code in this exercise to evaluate quickly. (This means you will see some warnings, such as about rank-deficient fits.)

- Create bootstrap resamples to evaluate these models. The function to create this kind of resample is `bootstraps()`.
- Evaluate both kinds of models, the linear regression model and the random forest model.
- Use the bootstrap resamples you created `car_boot` for evaluating both models.

<codeblock id="01_11">

First evaluate `lm_mod`, and then evaluate `rf_mod`.

</codeblock>

</exercise>

<exercise id="12" title="Plot modeling results">

You just trained models on bootstrap resamples of the training set and now have the results in `lm_res` and `rf_res`. These results are available in your environment, trained using the entire training set instead of 10% only. Now let's compare them. 

Notice in this code how we use [`bind_rows()`](https://dplyr.tidyverse.org/reference/bind.html) from dplyr to combine the results from both models, along with [`collect_predictions()`](https://tune.tidymodels.org/reference/collect_predictions.html) to obtain and format predictions from each resample.

**Instructions**

- First `collect_predictions()` for the linear model.
- Then `collect_predictions()` for the random forest model.

<codeblock id="01_12_1">

The two sets of results are available in `lm_res` and `rf_res`.

</codeblock>

**Instructions**

Wonderful! Sit back and run the given code to visualize the results!

<codeblock id="01_12_2">

You just need to run the code given to you.

</codeblock>

</exercise>














