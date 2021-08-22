---
title: 'Chapter 3: Get out the vote'
description:
  'In the third case study, you will use data on attitudes and beliefs in the United States to predict voter turnout. You will apply your skills in dealing with imbalanced data and explore more resampling options.'
prev: /chapter2
next: /chapter4
type: chapter
id: 3
---

<exercise id="1" title="Predicting voter turnout from survey data" type="slides">

<slides source="chapter3_01">
</slides>

</exercise>

<exercise id="2" title="Choose an appropriate model">

In this case study, you will predict whether a person voted or not in the United States 2016 presidential election from responses that person gave on a survey. The survey focuses on opinions about political and economic topics. What kind of model will you build?

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

<exercise id="3" title="Explore the VOTER data">

To do a good job with predictive modeling, you need to explore your dataset to understand it first. Start off this modeling analysis by checking out how many people voted or did not vote, and the answers to a few questions. The answers to the questions on this survey have been coded as integers, and the corresponding text has been provided for you here.
 
**Instructions**

- Load [tidyverse](https://tidyverse.tidyverse.org/).
- Take a look at `voters` to check out the data.
- In the call to `count()`, use the appropriate variable (`turnout16_2016`) to see how many examples you have of those who voted and did not vote.

<codeblock id="03_03_1">

To see how many people did and did not vote, use `count(turnout16_2016)`.

</codeblock>

**Instructions**

Check out how three responses on the survey vary with voting behavior by using [`group_by()`](https://dplyr.tidyverse.org/reference/group_by.html) and [`summarise()`](https://dplyr.tidyverse.org/reference/summarise.html).

<codeblock id="03_03_2">

First call `group_by()`, and then `summarise()`.

</codeblock>

</exercise>

<exercise id="4" title="Visualization for exploratory data analysis">

Visualization is a powerful tool for exploratory data analysis. Plotting your data before you start modeling gives you the opportunity to understand its characteristics. 📈
 
**Instructions**

- Call [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) to initialize a new plot.
- Use the correct ggplot2 `geom` to make a histogram of survey responses for one question (`econtrend_2016`) and examine the difference by voting behavior. 

On this question about how the economy is doing, an answer of 1 indicates "getting better", 2 indicates "about the same", 3 indicates "getting worse", and 4 indicates "don't know".

<codeblock id="03_04">

To make a histogram, use [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).

</codeblock>

</exercise>

<exercise id="5" title="Imbalanced data">

This is real data from the real world, so you need to think through important modeling concerns, including how imbalanced the class is that you want to predict. You have been exploring this data set in the past few exercises. What is your assessment?

<choice>
<opt text="This data set is imbalanced." correct="true">

There are over 20 times more people in this survey who said they did vote than who said they did not.

</opt>

<opt text="This data set does not have a significant amount of imbalance.">

Look at the dataset and notice how many people did vote and did not vote. Are the two categories about even or is one category much larger?

</opt>

<opt text="We can't tell from the information we have now whether the data set is imbalanced.">

We can tell whether our data is imbalanced by examining the data set and noticing how many people did vote and did not vote.

</opt>
</choice>

</exercise>

<exercise id="6" title="Training and testing data">

It's time to split your data into training and testing sets, in the same way that you created these subsets in the previous case studies. You want to split your data about evenly on the class `turnout16_2016`.

**Instructions**

- Load the tidymodels metapackage, for using the functions to split your data.
- Use the correct function to create a data split that divides `voters_select` into 80%/20% sections.
- Assign the 80% partition to `vote_train` and the 20% partition to `vote_test`.

<codeblock id="03_06">

The `initial_split()` function sets up the data partitioning, and then you can use that as input to call `training()` and `testing()`.

</codeblock>

</exercise>

<exercise id="7" title="VOTE 2016" type="slides">

<slides source="chapter3_07">
</slides>

</exercise>

<exercise id="8" title="Preprocess with a recipe">

This dataset needs to prepared for modeling.

**Instructions**

- Use a `recipe()` to preprocess your training data, `vote_train`.
- Upsample this training data with the function `step_upsample()`.

<codeblock id="03_08">

When you set up a recipe with `recipe(turnout16_2016 ~ ., data = vote_train)`, you are specifying that the following steps should be applied to your data to get it ready for data analysis.

</codeblock>

</exercise>

<exercise id="9" title="Create a modeling workflow">

In this case study, we'll experiment with a new engine for the random forest model, the ranger package. You can combine the model with your preprocessing steps (your recipe) in a [workflow()](https://tidymodels.github.io/workflows/) for convenience.

**Instructions**

- Use `rand_forest()` to specify a random forest model. Notice that we are using a different engine than in the first case study.
- Add the recipe and the model specification to the workflow.

<codeblock id="03_09">

You add a recipe with `add_recipe()` and you add a model specification with `add_model()`.

</codeblock>

</exercise>

<exercise id="10" title="Cross-validation" type="slides">

<slides source="chapter3_10">
</slides>

</exercise>

<exercise id="11" title="Understanding cross-validation">

When you implement 10-fold cross-validation repeated 5 times, you...

<choice>
<opt text="randomly divide your training data into 50 subsets and train on 49 at a time (assessing on the other subset), iterating through all 50 subsets for assessment.">

If you divide your data into 50 subsets, that would be called 50-fold cross-validation. For most practical situations, 50 folds is overkill.

</opt>

<opt text="randomly divide your training data into 10 subsets and train on 9 at a time (assessing on the other subset), iterating through all 10 subsets for assessment. Then you repeat that process 5 times." correct="true">

⚡️ Simulations and practical experience show that 10-fold cross-validation repeated 5 times is a great resampling approach for many situations. This approach involves randomly dividing your training data into 10 folds, or subsets or groups, and training on only 9 while using the other fold for assessment. You iterate through all 10 folds being used for assessment; this is one round of cross-validation. You can then repeat the whole process multiple, perhaps 5, times.

</opt>

<opt text="randomly divide your training data into 5 subsets and train on 4 at a time (assessing on the other subset), iterating through all 5 subsets. Then you repeat that process 10 times.">

If you divide your data into 5 subsets, that would be called 5-fold cross-validation. In many practical situations, 5 folds is not enough to get the maximum performance improvement possible.

</opt>
</choice>

</exercise>

<exercise id="12" title="Create cross-validation folds">

You can use tidymodels functions to create the kind of cross-validation folds appropriate for your use case. Here, try 10-fold cross-validation repeated 5 times.

**Instructions**

- The argument `v` specifies the number of folds for cross-validation.
- The argument `repeats` specifies the number of repeats.

<codeblock id="03_12">

Use argument `v = 10` and `repeats = 5` to implement 10-fold cross-validation repeated 5 times.

</codeblock>

</exercise>

<exercise id="13" title="Evaluate model performance" type="slides">

<slides source="chapter3_13">
</slides>

</exercise>

<exercise id="14" title="Resampling two models">

Let's use cross-validation resampling to evaluate performance for two kinds of models with this vote data. You've already learned how to create resamples, preprocess data for modeling, build a model specification, and combine this in a workflow; now it's time to put this all together and evaluate this model's performance. 

The training data available in your environment is 10% of its original size, to allow the code in this exercise to evaluate quickly. (This means you may see some warnings.)

**Instructions**

Use `fit_resamples()` to evaluate how this logistic regression model performs on the cross-validation resamples.

<codeblock id="03_14_1">

The workflow `vote_wf` contains both the recipe and the model specification, and can be fit to the resamples `vote_folds`.

</codeblock>

**Instructions**

- Now fit the resamples `vote_folds` to the random forest model.
- Compute the metrics `roc_auc`, `sensitivity`, and `specificity`.

<codeblock id="03_14_2">

The function `metric_set()` takes as its arguments the metrics you want to compute.

</codeblock>

</exercise>

<exercise id="15" title="Performance metrics from resampling">

Now, let's evaluate these results from resampling.

**Instructions**

Use the function `collect_metrics()` to obtain the metrics we specified from the resampling results.

<codeblock id="03_15">

You can obtain the metrics from the random forest results with `collect_metrics(rf_res)`.

</codeblock>

</exercise>

<exercise id="16" title="Which model is best?">

You have just spent most of this chapter exploring how to predict voter turnout based on survey responses. Of the two types of models you tried, which is the better choice? Which do you expect to perform better on new data?

<choice>
<opt text="Random forest">

Random forest models are very powerful, but the random forest model could not identify any of the people who did _not_ vote.

</opt>

<opt text="Logistic regression" correct="true">

Logistic regression is a simpler model, but in this case, it performed better and you can expect it to do a better job predicting on new data.

</opt>
</choice>

</exercise>

<exercise id="17" title="Back to the testing data">

When we used resampling to evaluate model performance with the **training set**, the logistic regression model performed better. Now, let's put this model to the test! 😎 

Let's use the `last_fit()` function to fit to the entire training set one time and evaluate one time on the **testing set**, with everything we've learned during this case study. Our model has not yet seen the testing data, so this last step is the best way to estimate how well the model will perform when predicting with new data.

**Instructions**

- Fit to the training set and evaluate on the testing set using `last_fit()`. 
- Create a confusion matrix for the results from the testing set.

<codeblock id="03_17">

Remember that `conf_mat()` is the function to find a confusion matrix.

</codeblock>

</exercise>

