---
title: 'Chapter 4: But what do the nuns think?'
description:
  'The last case study uses an extensive survey of Catholic nuns fielded in 1967 to once more put your practical machine learning skills to use. You will predict the age of these religious women from their responses about their beliefs and attitudes.'
prev: /chapter3
next: /chapter1
type: chapter
id: 4
---

<exercise id="1" title="Surveying Catholic sisters in 1967" type="slides">

<slides source="chapter1_01_introduction">
</slides>

</exercise>

<exercise id="2" title="Choosing an appropriate model">

In this case study, you will predict whether a person voted or not in the United States 2016 presidential election from responses that person gave on a survey. The survey focuses on opinions about political and economic topics. What kind of model will you build?

<choice>
<opt text="Summarization">

Summarization is not a type of supervised machine learning model we will cover in this course.

</opt>

<opt text="Clustering">

Clustering is an example of unsupervised machine learning, which we will not cover in this course.

</opt>

<opt text="Classification" correct="true">

A classification model predicts a group membership or discrete class label, not a numeric/continuous value or response.

</opt>

<opt text="Regression">

Correct! To predict a continuous, numeric quantity like age, use regression models.

</opt>
</choice>

</exercise>

<exercise id="3" title="Visualizing the age distribution">

The first step before you start modeling is to explore your data, and we are going to spend a little more time on this step in this last case study. To start with, check out the distribution of ages for the respondents in this survey. (Keep in mind throughout this case study that the data you have in your environment is one quarter of the real survey data.)

**Instructions**

- Load the tidyverse package, for functions to manipulate data from [dplyr](https://www.rdocumentation.org/packages/dplyr/) and [tidyr](https://www.rdocumentation.org/packages/tidyr/) and visualize data from [ggplot2](https://www.rdocumentation.org/packages/ggplot2/).
- Call `glimpse()` on `sisters67` to take a look at the structure of the data. Notice how many columns there are, and what their characteristics are.
- Plot a histogram of age.

<codeblock id="01_03">

You can build a histogram using [`geom_histogram()`](https://www.rdocumentation.org/packages/ggplot2/topics/geom_freqpoly).

</codeblock>

</exercise>

<exercise id="4" title="Tidying the survey data">

Embracing [tidy data principles](http://r4ds.had.co.nz/tidy-data.html) is a powerful option for exploratory data analysis. When your data is tidy, you can quickly iterate in getting to know your data better and making exploratory plots. Let's transform this wide data set into a tidy data frame with one observation per row, and then check out some characteristics of this subset of the original survey.

Note: There is a column called `sister` in this dataset that is an identifier for each survey respondent. We are removing this column in the exercise using [`select()`](https://www.rdocumentation.org/packages/dplyr/topics/select)._

**Instructions**

- Use the [`gather()`](https://www.rdocumentation.org/packages/tidyr/topics/gather) function to transform the wide data set with each survey question in a separate column to a narrow, tidy data set with each survey question in a separate row.
- View the structure of this tidy data set using `glimpse()`.

<codeblock id="01_03">

When you implement `... %>% gather(key, value, -age)`, you transform the data set from wide (non-tidy) to narrow (tidy). The argument `-age` specifies that we want to keep the `age` column for each row.

</codeblock>

Embracing [tidy data principles](http://r4ds.had.co.nz/tidy-data.html) is a powerful option for exploratory data analysis. When your data is tidy, you can quickly iterate in getting to know your data better and making exploratory plots. Let's transform this wide data set into a tidy data frame with one observation per row, and then check out some characteristics of this subset of the original survey.

Note: There is a column called `sister` in this dataset that is an identifier for each survey respondent. We are removing this column in the exercise using [`select()`](https://www.rdocumentation.org/packages/dplyr/topics/select)._

**Instructions**

- Use the [`gather()`](https://www.rdocumentation.org/packages/tidyr/topics/gather) function to transform the wide data set with each survey question in a separate column to a narrow, tidy data set with each survey question in a separate row.
- View the structure of this tidy data set using `glimpse()`.

<codeblock id="01_03">

When you implement `... %>% gather(key, value, -age)`, you transform the data set from wide (non-tidy) to narrow (tidy). The argument `-age` specifies that we want to keep the `age` column for each row.

</codeblock>

**Instructions**

- Group by `age` and summarize the `value` column to see how the overall agreement with all questions varied by age.
- Count the `value` column to check out how many respondents agreed or disagreed overall.

<codeblock id="01_03">

- Call the `group_by()` function first, and then `summarize()`. 
- To count the `value` column, use `count(value)`.

</codeblock>

</exercise>

<exercise id="5" title="Exploratory data analysis with tidy data" type="slides">

<slides source="chapter1_01_introduction">
</slides>

</exercise>

<exercise id="6" title="Visualizing agreement with age">

The tidied version of the survey data that you constructed is available in your environment. You have many options at your fingertips with this tidy data now. Make a plot that shows how agreement on a subset of the questions changes with age.

In this exercise, we are using [`filter()`](https://www.rdocumentation.org/packages/dplyr/topics/filter) to subset the data to just a subset of the questions on the survey to look at.

**Instructions**

- Group by two variables, `key` and `value`, so you can calculate an average age for each answer to each question.
- Summarize for each grouping to find an average age.
- Choose the correct `geom` to make a line plot.

<codeblock id="01_03">

- You want to `group_by(key, value)` and `summarize(age)` to find the average age for each ansewr to each question.
- You can build a line plot using [`geom_line()`](https://www.rdocumentation.org/packages/ggplot2/topics/geom_path).

</codeblock>

</exercise>

<exercise id="7" title="Building a simple linear model">

You have gotten to know this data a bit through exploratory data analysis, and now it's time to build the simplest possible model, in preparation for more complex predictive modeling. For this data set where we want to predict age from the survey responses (age coded as integers), we can build a simple linear model for all our data using only the [`lm()`](https://www.rdocumentation.org/packages/stats/topics/lm) function.

**Instructions**

- Remove the identifier column `sister` from the dataset to create `sisters_select`. 
- Use the correct variable on the left-hand side of the equation so that you build a model predicting age as a function of all other columns. 
- Call `summary()` for the simple model you've built to see the results.

<codeblock id="01_03">

- We want to predict age using all other variables, so the first argument to `lm()` should be `age ~ .`.
- Remove the `sister` identifier from the data set with `select(sisters67, -sister)`.
- You can examine the results of this simple modeling with `summary(simple_lm)`.

</codeblock>

</exercise>

<exercise id="8" title="Training, validation, and testing data">

It's time to split your data into different sets now. You've done this three times already in this course, but in this last case study we are also going to create a validation set. Using a validation set is important anytime you will compare multiple models and choose between them, or adjust hyperparameters in a model. 

We are going to split the data into 60% training, 20% validation, 20% testing.

**Instructions**

- Create two data partitions: 
    - Specify one to split between training (60%) and validation/testing (40%).
    - Specify another one to split between validation and testing (50% each).

<codeblock id="01_03">

The [`createDataPartition()`](https://www.rdocumentation.org/packages/caret/topics/createDataPartition) function creates a vector that specifies which examples belong in the training set, or the test set.

</codeblock>

</exercise>

<exercise id="9" title="Using your validation set">

This new validation set you just created will be used to...

Hint: The validation data is used after the training data but before the testing data.

<choice>
<opt text="train your models.">

Training is done with the training set.

</opt>

<opt text="compare models you have trained and choose which one to use." correct="true">

Correct! A validation test is used to compare models or tune hyperparameters.

</opt>

<opt text="do the final evaluation step where you estimate the performance of your model on new data.">

The final evaluation is done with the testing set. It is important to do this final evaluation with a separate data set so that you do not underestimate your error on new data.

</opt>
</choice>

</exercise>

<exercise id="10" title="Predicting age with supervised machine learning" type="slides">

<slides source="chapter1_01_introduction">
</slides>

</exercise>

<exercise id="11" title="Training, validation, and testing data">

In this chapter, you will explore a few new kinds of models. Fun! The `"gbm"` gradient boosting and `"xbgLinear"` extreme gradient boosting models take a very long time to train, so we'll upload trained models for you to evaluate in the next exercises. In this exercise, train a CART model with `"rpart"` to predict age with all the other columns.

To allow the code in this exercise to evaluate quickly, the training set in your environment only contains 500 rows. (You'll see a warning because the training set here is so small.)

**Instructions**

- Using caret, train a CART model to predict `age` based on all other variables on `training` data. 

When you don't give any specific [`trainControl()`](https://www.rdocumentation.org/packages/caret/topics/trainControl) argument to `train()`, the model training is implemented with a default resampling strategy, 25 bootstrap resamplings.

<codeblock id="01_03">

- To train a model use the `train()` function. 
- The `method` argument to `train()` should be `"rpart"`.

</codeblock>

</exercise>

<exercise id="12" title="Making predictions">

Three models are available in your environment (trained on the data set in its entirety), the CART model you just trained along with two kinds of gradient boosting models. Your next task is to decide which of these models to use for prediction on new data. If you use the training data to evaluate the models, you will underestimate your error for new data and might make the wrong choice altogether. That leaves the validation data and the testing data.

**Instructions**

- Which data set should you use to choose between these three models, `validation` or `testing`? Use that option to create a data frame for comparing the models.

<codeblock id="01_03">

The validation data set is the appropriate option for choosing between models.

</codeblock>

</exercise>

<exercise id="13" title="Choosing between models">

Now that you have created a data frame that contains all three models' predictions, let's compare their performance.

**Instructions**

- Load `yardstick`. 
- Use the [`metrics()`](https://www.rdocumentation.org/packages/yardstick/topics/metrics) function from the yardstick package to see how each model performed. There are two important arguments that you need to supply to `metrics()`, `truth` (the true age of each nun) and `estimate` (the predicted age of each nun). Which column in the data frame you created corresponds to each?

<codeblock id="01_03">

The `truth` argument should always be `age`, while the `estimate` column changes with each model.

</codeblock>

</exercise>

<exercise id="14" title="Estimating uncertainty for new data">

You just compared the three models you trained, and the `gbm` model performed best on the validation data set. Gradient boosting models are very effective and are a powerful tool in your machine learning arsenal. Before you take a trained model like this and use it to make predictions on new data, you must estimate how your final chosen model will perform. Specifically, let's estimate the [`rmse()`](https://www.rdocumentation.org/packages/yardstick/versions/0.0.1/topics/rmse) for this model.

**Instructions**

- Which data set would you use to estimate how your model will perform on new data? You have `training`, `validation`, and `testing` data sets available in your environment. Use the correct one *both* at the beginning of the pipe and within the call to `predict()`.
- Calculate the RMSE (root mean squared error) using the appropriate function from [yardstick](https://www.rdocumentation.org/packages/yardstick).

<codeblock id="01_03">

You want to use the `testing` data along with the `rmse()` function.

</codeblock>

</exercise>

<exercise id="15" title="Wrapping up" type="slides">

<slides source="chapter1_01_introduction">
</slides>

</exercise>
