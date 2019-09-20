---
title: 'Chapter 1: Not mtcars AGAIN'
description:
  'In this first case study, you will predict fuel efficiency from a US Department of Energy data set for real cars of today.'
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Making predictions using machine learning" type="slides">

<slides source="chapter1_01">
</slides>

</exercise>

<exercise id="2" title="Choosing an appropriate model">

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

Correct! 👏 To predict a continuous, numeric quantity like fuel efficiency, use regression models.

</opt>
</choice>

</exercise>

<exercise id="3" title="Visualizing the fuel efficiency distribution">

The first step before you start modeling is to explore your data. In this course we'll practice using tidyverse functions for exploratory data analysis. Start off this case study by examinign your data set and visualizing the distribution of fuel efficiency. The ggplot2 package, with functions like [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) and [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html) are included in the tidyverse.

**Instructions**

The first time you run a code exercise, it may take a little while for tyourDocker container on [mybinder.org](https://mybinder.org/v2/gh/juliasilge/supervised-ML-case-studies-course/binder) to load. ⏳ Try to be patient!

`tidyverse` is loaded for you. 

- Print the `cars2018` object. Notice that some of the column names have spaces in them and are surrounded by backticks, like `` `Recommended Fuel` ``.
- Use the appropriate column from the data set in the call to `aes()` so you can plot a histogram of fuel efficiency (MPG).
- Set the correct `x` and `y` labels.

<codeblock id="01_03">

- The column `MPG` contains the fuel efficiency measurements so to make the plot, call `aes(x = MPG)`.
- The number of cars goes on the y-axis and the fuel efficiency goes on the x-axis.

</codeblock>

</exercise>

<exercise id="4" title="Building a simple linear model">

Before embarking on more complex machine learning models, it's a good idea to build the simplest possible model to get an idea of what is going on. In this case, that means fitting a simple linear model using base R's `lm()` function.

**Instructions**

- Use [`select()`](https://dplyr.tidyverse.org/reference/select.html) to deselect the two columns `Model` and `Model Index` from the model; these columns tell us the individual identifiers for each car and it would *not* make sense to include them in modeling. 
- Fit `MPG` as the predicted quantity, explained by all the predictors, i.e., `.` in the R formula input to `lm()`. (You may have noticed the log distribution of MPG in the last exercise, but don't worry about fitting the logarithm of fuel efficiency yet.) 
- Print the summary of the model.

<codeblock id="01_04">

- To deselect the `Model` column, use `cars2018 %>% select(-Model)`.

</codeblock>

</exercise>

<exercise id="5" title="Getting started with caret" type="slides">

<slides source="chapter1_05">
</slides>

</exercise>

<exercise id="6" title="Training and testing data">

Training models based on all of your data at once is typically not the best choice. 🚫 Instead, you can create subsets of your data that you use for different purposes, such as *training* your model and then *testing* your model. 

Creating training/testing splits reduces overfitting. When you evaluate your model on data that it was not trained on, you get a better estimate of how it will perform on new data.

**Instructions**

- Load the `rsample` package. 
- Create a data split that divides the original data into 80%/20% sections and (roughly) evenly divides the partitions between the different types of `Transmission`.
- Assign the 80% partition to `car_train` and the 20% partition to `car_test`.

<codeblock id="01_06">

- To load a package in R, use `library(package_name)`.
- `initial_split()` takes as its arguments, after the data that you pipe in: `prop`, the proportion of data to include in the training set, and then `strata`, the variable to partition evenly across.
- Once you create the `car_split` object, you can use it to determine your training set and testing set.

</codeblock>

</exercise>

<exercise id="7" title="Training models with caret">

Now that your `car_train` data is ready, you can fit a set of models with caret. The [`train()`](https://topepo.github.io/caret/model-training-and-tuning.html#model-training-and-parameter-tuning) function from caret is flexible and powerful. It allows you to try out many different kinds of models and fitting procedures. To start off, train one linear regression model and one random forest model, without any resampling. (This is what `trainControl(method = "none")` does; it turns off all resampling.)

**Instructions**

- Load the caret package. 
- Train a basic linear regression model on your `car_train` data. 

(Notice that we are fitting to `log(MPG)` since the fuel efficiency had a log normal distribution.)

<codeblock id="01_07_1">

For linear regression, use `method = "lm"`.

</codeblock>

**Instructions**

- Train a random forest model on your `car_train` data.

<codeblock id="01_07_2">

For random forest, use `method = "rf"`.

</codeblock>

</exercise>

<exercise id="8" title="Evaluating your models">

The `fit_lm` and `fit_rf` models you just trained are in your environment. It's time to evaluate them! 🤩 For regression models, we will focus on evaluating using the **root mean squared error**. This quantity is measured in the same units as the original data (log of miles per gallon, in our case). Lower values indicate a better fit to the data. It's not too hard to calculate root mean squared error manually, but the [yardstick](https://tidymodels.github.io/yardstick/) package offers convenient functions for this and other model performance metrics.

**Instructions**

- Load the yardstick package. 
- Create new columns for model predictions from each of the models you have trained, first linear regression and then random forest.
- Evaluate the performance of these models using [`metrics()`](https://tidymodels.github.io/yardstick/reference/metrics.html) by specifying the column in the original data that contains the real fuel efficiency.

<codeblock id="01_08">

- Use `fit_lm` to predict the values for linear regression and `fit_rf` to predict values for random forest.
- The "truth" column in the original data is the column that holds fuel efficiency, `MPG`.

</codeblock>

</exercise>

<exercise id="9" title="Using the testing data">

"But wait!" you say, because you have been paying attention. 🤔 "That is how these models perform on the *training* data, the data that we used to build these models in the first place." Let's evaluate how these simple models perform on the testing data.

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

In the last set of exercises, you trained linear regression and random forest models without any resampling. Resampling can improve the accuracy of machine learning models, and reduce overfitting.

Let's try bootstrap resampling, which means creating data sets the same size as the original one by randomly drawing with replacement from the original. In caret, the default behavior for bootstrapping is 25 resamplings, but you can change this using [`trainControl()`](https://topepo.github.io/caret/model-training-and-tuning.html#tune) if desired.

**Instructions**

The data sets available in your environment are 10% of their original size, to allow the code in this exercise to evaluate quickly. (This means you may see some warnings.)

- Which data set should you train these models with, `car_train` or `car_test`?
- Train these models using bootstrap resampling. The method for this is `"boot"`.

<codeblock id="01_11">

You should still use the training data, `car_train`, for training these models.

</codeblock>

</exercise>

<exercise id="12" title="Plotting modeling results">

You just trained models using bootstrap resampling, `cars_lm_bt` and `cars_rf_bt`. These models are available in your environment, trained on the entire training set instead of 10% only. Now let's evaluate how those models performed and compare them. We will again use `metrics()` from the yardstick package, but also we will plot the model predictions to inspect them visually.

Notice in this code how we use [`gather()`](https://tidyr.tidyverse.org/reference/gather.html) from tidyr (another tidyverse package) to tidy the data frame and prepare it for plotting with ggplot2.

**Instructions**

- Use [`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html) to create the new columns with the predictions from the two models you trained.
- Choose which columns should be specified as `truth` and which should be `estimate` when calling `metrics()`.

<codeblock id="01_12_1">

Specify the `MPG` column as `truth` and the column created from the prediction (either `Linear regression` or `Random forest`) as `estimate`.

</codeblock>

**Instructions**

Wonderful! Sit back and run the given code to visualize the results!

<codeblock id="01_12_2">

You just need to run the code given to you.

</codeblock>

</exercise>














