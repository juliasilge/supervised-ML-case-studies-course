---
title: 'Chapter 2: Stack Overflow Developer Survey'
description:
  'Stack Overflow is the world''s largest online community for developers, and you have probably used it to find an answer to a programming question. The second chapter of this course uses data from the annual Stack Overflow Developer Survey to practice predictive modeling and find which developers are more likely to work remotely.'
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---

<exercise id="1" title="Essential copying and pasting from Stack Overflow" type="slides">

<slides source="chapter2_01">
</slides>

</exercise>

<exercise id="2" title="Choosing an appropriate model">

In this case study, you will predict whether a developer works remotely or not (i.e., in their company offices) from characteristics of these developers, like experience and size of the company. In this analysis, we will assume that a software developer can either work remotely, or not. What kind of model will you build?

<choice>
<opt text="Summarization">

Summarization is not a type of supervised machine learning model we will cover in this course.

</opt>

<opt text="Clustering">

Clustering is an example of unsupervised machine learning, which we will not cover in this course.

</opt>

<opt text="Classification" correct="true">

Correct! To predict group membership or discrete class labels, use classification models.

</opt>

<opt text="Regression">

A regression model predicts a numeric/continuous value or response, not a group membership or discrete class label.

</opt>
</choice>

</exercise>

<exercise id="3" title="Exploring the Stack Overflow survey">

Anytime you are planning to implement modeling, it is always a good idea to explore your dataset. Start off this modeling analysis by checking out how many remote and non-remote developers have to work with, where they live, and how much experience they have.

**Instructions**

- Print the `stackoverflow` object.
- In the calls to [`count()`](https://dplyr.tidyverse.org/reference/tally.html), check out the distributions for remote status first, and then country.

<codeblock id="02_03_1">

To see how many developers work remotely and do *not* work remotely, use `count(Remote, sort = TRUE)`.

</codeblock>

**Instructions**

Use the appropriate column from the data set so you can plot a boxplot with remote status on the x-axis and professional experience on the y-axis.

<codeblock id="02_03_2">

The column `Remote` contains the remote status of each developer while the `YearsCodedJob` column contains how many years of experience each developer has.

</codeblock>

</exercise>

<exercise id="4" title="Start with a simple model">

Before starting the process of building machine learning models, let's start by building an extremely simple model to get our bearings. This is not a model you would probably want to use to make predictions on new data, but it can give you an idea about how successful you may eventually be and which predictors are most important.

Recall that when you use the pipe operator `%>%` with a function like [`glm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/glm.html) (whose first argument is not `data`), you must specify `data = .` to indicate that you are piping in the modeling data set.

**Instructions**

Build a simple logistic regression model predicting remote status.

- Use `select()` to deselect the column `Respondent` from the data set before using it in modeling.
- Fit `Remote` as the predicted quantity, explained by all the predictors, i.e., `.` in the R formula input to `glm()`. Don't get confused with the two instances of `.`!
 In the calls to [`count()`](https://dplyr.tidyverse.org/reference/tally.html), check out the distributions for remote status first, and then country.

<codeblock id="02_04">

To fit a logistic regression model using the pipe operator `%>%`, specify your model as `glm(Remote ~ ., family = "binomial", data = .)`. The first `.` here means that we want to predict `Remote` based on *all* the other columns in the data set, while the second `.` means that we have piped in the data set to the call to `glm()`.

</codeblock>

</exercise>

<exercise id="5" title="Dealing with imbalanced data" type="slides">

<slides source="chapter2_05">
</slides>

</exercise>

<exercise id="6" title="Training and testing data">

Before you deal with the imbalance in the remote/not remote classes, first split your data into training and testing sets. You create subsets of your data for *training* and *testing* your model for the same reasons you did before: to reduce overfitting and obtain a more accurate estimate for how your model will perform on new data.

**Instructions**

Create a data split that divides the original data into 80%/20% sections and about evenly divides the sections between the different classes of `Remote`.

- Load the `rsample` package.
- Create `stack_split`:
    - For the first argument to [`initial_split()`](https://tidymodels.github.io/rsample/reference/initial_split.html), use a value for `p` of 0.8.
    - For the second argument to `initial_split()`, pass the name of the variable that contains remote status as a string.
- Assign the 80% partition to `stack_train` and the 20% partition to `stack_test`.

<codeblock id="02_06">

Use the output of `initial_split()` as the input of `training()` and `testing()`.

</codeblock>

</exercise>

<exercise id="7" title="Upsampling">

There are multiple possible approaches to dealing with class imbalance. ⚖️ Here, you will implement upsampling using caret's [`upSample()`](https://topepo.github.io/caret/subsampling-for-class-imbalances.html#subsampling-techniques) function.

**Instructions**

- Use the `stack_train` data set for upsampling: 
    - `x` should use `select()` to grab only the predictors from the data.
    - `y` should be the class memberships in `stack_train` as a vector (use `$` notation).
    - The label for the class column goes in `yname`; remember that it is `"Remote"`.
	
<codeblock id="02_07">

- The class memberships that must be assigned to `y` are `training$Remote`.
- This function needs to also know the label for the class column, as `yname = "Remote"`.

</codeblock>

</exercise>

<exercise id="8" title="Understanding upsampling">

Consider the original data set `stackoverflow`, the training set that you created `stack_train`, and the upsampled set you created `up_train`. Both `stackoverflow` and `stack_train` have almost 10 times as many non-remote developers as remote developers. 

How do the remote and non-remote developers in `up_train` compare?

<choice>
<opt text="There are more remote developers.">

Upsampling changes the proportion of remote and non-remote developers, but *not* so that there are more non-remote developers.

</opt>

<opt text="There are more non-remote developers.">

Although there were more non-remote developers in the original dataset, upsampling changes this ratio so that the classes are balanced.

</opt>

<opt text="There are the same number of remote and non-remote developers." correct="true">

Correct! Upsampling samples with replacement until the class distributions are equal, so there are the same number of remote and non-remote developers after upsampling.

</opt>

</choice>

</exercise>

<exercise id="9" title="Upsampling in your workflow">

We are starting to add more steps into the machine learning workflow. Think about when we implemented upsampling to deal with class imbalance. Which data set did we upsample?

<choice>
<opt text="The original data.">

We used upsampling only on a subset of the data, because its purpose is only applicable for part of the predictive modeling workflow. Does upsampling help you do a better job of training your model or testing your model?

</opt>

<opt text="The training data." correct="true">

Correct! ⭐️ Adjusting class imbalance helps you train a model that performs better.

</opt>

<opt text="The testing data.">

We do not want to artificially balance the test set; the test set needs to be close to what we will see when applying our model on new data.

<opt text="It doesn't matter! We'll upsample it all eventually anyway.">

We do not upsample all subsets of our data, because we do not want to artificially balance the test set.

</opt>

</choice>

</exercise>

<exercise id="10" title="Predicting remote status" type="slides">

<slides source="chapter2_10">
</slides>

</exercise>

<exercise id="11" title="Training models">

Finally! 😁 It's time to train predictive models for this data set of Stack Overflow Developer Survey responses. We will continue to use the powerful, flexible [`train()`](https://topepo.github.io/caret/model-training-and-tuning.html#model-training-and-parameter-tuning) function from caret to specify our machine learning models.

To keep the code in this exercise evaluating quickly, the data sets in your environment are 1% of their original size. (This means you may see some warnings due to the subsampling.)

**Instructions**

Build a logistic regression model using `method = "glm"` and `family = "binomial"` while implementing upsampling to address class imbalance.

<codeblock id="02_11_1">

To upsample the training set within the call to `train()`, use `sampling = "up"` inside of `trainControl()`.

</codeblock>

**Instructions**

Build a random forest model while implementing upsampling to address class imbalance.

<codeblock id="02_11_2">

Use `method = "rf"` to build a random forest model.

</codeblock>

</exercise>

<exercise id="12" title="Confusion matrix">

A confusion matrix describes how well a classification model (like the ones you just trained!) performs. A confusion matrix tabulates how many examples in each class were correctly classified by a model. In your case, it will show you how many remote developers were classified as remote and how many non-remote developers were classified as non-remote; the confusion matrix also shows you how many were classified into the **wrong** categories.

Here you will use the [`conf_mat()`](https://tidymodels.github.io/yardstick/reference/conf_mat.html) function from yardstick to evaluate the performance of the two models you trained, `stack_glm` and `stack_rf`. The models available in your environment were trained on all the training data, not only 1%.

**Instructions**

Print the confusion matrix for the `stack_glm` model on the `stack_test` data. Note that the first argument to `conf_mat()` is `truth` and the second is `estimate`.

<codeblock id="02_12_1">

You are evaluating your models, so you should use the testing data set for all the possible arguments here.

</codeblock>

**Instructions**

Print the confusion matrix for the `stack_rf` model on the `stack_test` data.

<codeblock id="02_12_2">

Use the `conf_mat()` function to build a confusion matrix.

</codeblock>

</exercise>

<exercise id="13" title="Classification model metrics">

The `conf_mat()` function is helpful but often you also want to store specific performance estimates for later, perhaps in a dataframe-friendly form. The yardstick package is built to handle such needs. For this kind of classification model, you might look at the [positive or negative predictive value](https://tidymodels.github.io/yardstick/reference/ppv.html) or perhaps overall [accuracy](https://tidymodels.github.io/yardstick/reference/accuracy.html).

The models available in your environment, `stack_glm` and `stack_rf` were trained on all the training data, not only 1%.

**Instructions**

- Load the yardstick package. 
- Predict values for logistic regression (`stack_glm`) and random forest (`stack_rf`).  
- Calculate both accuracy and positive predictive value for these two models.
	
<codeblock id="02_13">

The function for accuracy is `accuracy()` and the function for positive predictive value is `ppv()`.

</codeblock>

</exercise>





