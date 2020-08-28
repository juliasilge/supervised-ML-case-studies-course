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

<exercise id="2" title="Choose an appropriate model">

In this case study, you will predict whether a developer works remotely or not (i.e., in their company offices) from characteristics of these developers, like experience and size of the company. In this analysis, we will assume that a software developer can either work remotely, or not. What kind of model will you build?

<choice>
<opt text="Summarization">

Summarization is not a type of supervised machine learning model we will cover in this course.

</opt>

<opt text="Clustering">

Clustering is an example of unsupervised machine learning, which we will not cover in this course.

</opt>

<opt text="Classification" correct="true">

To predict group membership or discrete class labels, use classification models.

</opt>

<opt text="Regression">

A regression model predicts a numeric/continuous value or response, not a group membership or discrete class label.

</opt>
</choice>

</exercise>

<exercise id="3" title="Explore the Stack Overflow survey">

Anytime you are planning to implement modeling, it is always a good idea to explore your dataset. Start off this modeling analysis by checking out how many remote and non-remote developers you have to work with, where they live, and how much experience they have.

**Instructions**

- Take a look at the `stack_overflow` object.
- In the calls to [`count()`](https://dplyr.tidyverse.org/reference/tally.html), check out the distributions for remote status first, and then country.

<codeblock id="02_03_1">

To see how many developers work remotely and do *not* work remotely, use `count(remote, sort = TRUE)`.

</codeblock>

**Instructions**

Use the appropriate column from the data set so you can plot a boxplot with remote status on the x-axis and professional experience on the y-axis.

<codeblock id="02_03_2">

The column `remote` contains the remote status of each developer while the `years_coded_job` column contains how many years of experience each developer has.

</codeblock>

</exercise>

<exercise id="4" title="Training and testing data">

Before you deal with the imbalance in the remote/not remote classes, first split your data into training and testing sets. You create subsets of your data for *training* and *testing* your model for the same reasons you did before: to reduce overfitting and obtain a more accurate estimate for how your model will perform on new data.

**Instructions**

Create a data split that divides the original data into 80%/20% sections and about evenly divides the sections between the different classes of `remote`.

- Load the `tidymodels` metapackage.
- Create `stack_split`:
    - For the first argument to [`initial_split()`](https://tidymodels.github.io/rsample/reference/initial_split.html), use a value for `p` of 0.8.
    - For the second argument to `initial_split()`, stratify the split by remote status.
- Use `training()` to assign the 80% partition to `stack_train` and use `testing()` to assign the 20% partition to `stack_test`.

<codeblock id="02_04">

Use the output of `initial_split()` as the input of `training()` and `testing()`.

</codeblock>

</exercise>

</exercise>

<exercise id="5" title="Dealing with imbalanced data" type="slides">

<slides source="chapter2_05">
</slides>

</exercise>

<exercise id="6" title="Preprocess with a recipe">

There are multiple possible approaches to dealing with class imbalance. ⚖️ Here, you will implement downsampling using the [`step_downsample()`](https://tidymodels.github.io/recipes/reference/step_downsample.html) function.

**Instructions**

- Use a `recipe()` to preprocess your training data. 
- Downsample this data with respect to the remote status of the developers.
	
<codeblock id="02_06">

When you use `step_downsample(remote)`, you are saying "downsample my data so that the remote class is balanced".

</codeblock>

</exercise>

<exercise id="7" title="Downsampling">

Once your recipe is defined, you can estimate the parameters required to actually preprocess the data, and then extract the processed data. This typically isn't necessary is you use a `workflow()` for modeling, but it can be helpful to diagnose problems or explore your preprocessing results.

**Instructions**

- First, `prep()` the recipe.
- Then, `juice()` the prepped recipe.	
	
Check out the results of counting remote status after downsampling! You likely will not need to `juice()` when building a model but you can use this for exploration.	
	
<codeblock id="02_07">

When you `juice()` the prepped recipe `stack_prep`, you extract the processed (i.e. balanced) data.

</codeblock>

</exercise>

<exercise id="8" title="Understand downsampling">

Consider the original data set `stack_overflow`, the training set that you created `stack_train`, and the downsampled set you created `stack_down`. Both `stack_overflow` and `stack_train` have almost 10 times as many non-remote developers as remote developers. 

How do the remote and non-remote developers in `stack_down` compare?

<choice>
<opt text="There are more remote developers.">

Downsampling changes the proportion of remote and non-remote developers, but *not* so that there are more non-remote developers.

</opt>

<opt text="There are more non-remote developers.">

Although there were more non-remote developers in the original dataset, downsampling changes this ratio so that the classes are balanced.

</opt>

<opt text="There are the same number of remote and non-remote developers." correct="true">

Downsampling removes from the majority class until the class distributions are equal, so there are the same number of remote and non-remote developers after downsampling.

</opt>

</choice>

</exercise>

<exercise id="9" title="Downsampling in your workflow">

We are starting to add more steps into the machine learning workflow. Think about when we implemented downsampling to deal with class imbalance. Which data set did we downsample?

<choice>
<opt text="The original data.">

We used downsampling only on a subset of the data, because its purpose is only applicable for part of the predictive modeling workflow. Does downsampling help you do a better job of training your model or testing your model?

</opt>

<opt text="The training data." correct="true">

⭐️ Adjusting class imbalance helps you train a model that performs better.

</opt>

<opt text="The testing data.">

We do not want to artificially balance the test set; the test set needs to be close to what we will see when applying our model on new data.

<opt text="It doesn't matter! We'll downsample it all eventually anyway.">

We do not downsample all subsets of our data, because we do not want to artificially balance the test set.

</opt>

</choice>

</exercise>

<exercise id="10" title="Predicting remote status" type="slides">

<slides source="chapter2_10">
</slides>

</exercise>

<exercise id="11" title="Train models">

Finally! 😁 It's time to train predictive models for this data set of Stack Overflow Developer Survey responses. We will specify our machine learning models with parsnip, and use [workflows](https://tidymodels.github.io/workflows/) for convenience.

**Instructions**

- Specify a logistic regression model using `logistic_reg()`.
- Build a `workflow()` to hold your modeling components.
- Add your model specification to your `workflow()` before fitting.

<codeblock id="02_11_1">

You can add your model specification to your `workflow()` by piping `stack_wf %>% add_model(glm_spec)`.

</codeblock>

**Instructions**

Build a decision tree model with downsampling.

- Specify a decision tree regression model using `decision_tree()`.
- Add your recipe `stack_recipe` to your `workflow()`.
- Fit your workflow, after you have added your model to it.

<codeblock id="02_11_2">

A workflow needs both a preprocessor (such as a recipe or formula) and a model to be fit.

</codeblock>

</exercise>

<exercise id="12" title="Confusion matrix">

A confusion matrix describes how well a classification model (like the ones you just trained!) performs. A confusion matrix tabulates how many examples in each class were correctly classified by a model. In your case, it will show you how many remote developers were classified as remote and how many non-remote developers were classified as non-remote; the confusion matrix also shows you how many were classified into the **wrong** categories.

Here you will use the [`conf_mat()`](https://tidymodels.github.io/yardstick/reference/conf_mat.html) function from yardstick to evaluate the performance of the two models you trained, `stack_glm` and `stack_tree`. The models available in your environment were trained on the training data.

**Instructions**

Print the confusion matrix for the `stack_glm` model on the `stack_test` data. If we wanted to compare more than two modeling options, we should definitely create some resampled data sets like we did in the first case study. This case study is already getting long, so let's stick with the testing data.

Note that the first argument to `conf_mat()` is `truth` and the second is `estimate`.

<codeblock id="02_12_1">

Use the arguments `truth = remote` and `estimate = .pred_glm`.

</codeblock>

**Instructions**

Print the confusion matrix for the `stack_tree` model on the `stack_test` data.

<codeblock id="02_12_2">

Use the `conf_mat()` function to build a confusion matrix.

</codeblock>

</exercise>

<exercise id="13" title="Classification model metrics">

The `conf_mat()` function is helpful but often you also want to store specific performance estimates for later, perhaps in a dataframe-friendly form. The yardstick package is built to handle such needs. For this kind of classification model, you might look at the [positive or negative predictive value](https://tidymodels.github.io/yardstick/reference/ppv.html) or perhaps overall [accuracy](https://tidymodels.github.io/yardstick/reference/accuracy.html).

The models available in your environment, `stack_glm` and `stack_tree` were trained on the training data.

**Instructions**

- Predict values for logistic regression (`stack_glm`) and decision tree (`stack_tree`).  
- Calculate both accuracy and positive predictive value for these two models.
	
<codeblock id="02_13">

The function for accuracy is `accuracy()` and the function for positive predictive value is `ppv()`.

</codeblock>

</exercise>





