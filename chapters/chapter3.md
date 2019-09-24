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

Correct! To predict group membership or discrete class labels, use classification models.

</opt>

<opt text="Regression">

A regression model predicts a numeric/continuous value or response, not a group membership or discrete class label.

</opt>
</choice>

</exercise>

<exercise id="3" title="Exploring the VOTER data">

To do a good job with predictive modeling, you need to explore your dataset to understand it first. Start off this modeling analysis by checking out how many people voted or did not vote, and the answers to a few questions. The answers to the questions on this survey have been coded as integers, and the corresponding text has been provided for you here.
 
**Instructions**

- Load [tidyverse](https://tidyverse.tidyverse.org/).
- Print `voters` to check out the data.
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

Correct! There are over 20 times more people in this survey who said they did vote than who said they did not.

</opt>

<opt text="This data set does not have a significant amount of imbalance.">

Look at the dataset and notice how many people did vote and did not vote. Are the two categories about even or is one category much larger?

</opt>

<opt text="We can't tell from the information we have now whether the data set is imbalanced.">

We can tell whether our data is imbalanced by examining the data set and noticing how many people did vote and did not vote.

</opt>
</choice>

</exercise>

<exercise id="6" title="Fit a simple model">

Start off a predictive modeling project by building the simplest possible model, to learn about the data and questions you are dealing with. Here, you will fit a simple logistic regression model on the whole data set to get an idea of what is going on.

**Instructions**

- Use [`select()`](https://dplyr.tidyverse.org/reference/select.html) to remove the column `case_identifier` from `voters` and assign it to `voters_select`. 
- Fit a logistic regression model to predict `turnout16_2016` explained by all the other variables in `voters_select`.

<codeblock id="03_06">

- The formula for your model should be `turnout16_2016 ~ .` . 
- To fit a logistic regression model, use `family = "binomial"`.

</codeblock>

</exercise>

<exercise id="7" title="VOTE 2016" type="slides">

<slides source="chapter3_07">
</slides>

</exercise>

<exercise id="8" title="Training and testing data">

It's time to split your data into training and testing sets, in the same way that you created these subsets in the previous case studies. You want to split your data about evenly on the class `turnout16_2016`.

**Instructions**

- Load the rsample package, for using the functions to split your data.
- Use the correct function to create a data split that divides `voters_select` into 80%/20% sections.
- Assign the 80% partition to `vote_train` and the 20% partition to `vote_test`.

<codeblock id="03_08">

The `initial_split()` function sets up the data partitioning, and then you can use that as input to call `training()` and `testing()`.

</codeblock>

</exercise>

<exercise id="9" title="Upsampling for imbalanced data">

It's time to start training your predictive models using caret's [train()](https://topepo.github.io/caret/model-training-and-tuning.html#model-training-and-parameter-tuning) function. This survey data set is imbalanced, with many more examples of people who said they voted than people who did not. To build a model that performs better, you should deal with this class imbalance. In this exercise, use upsampling, the same approach we used in the last case study.

**Instructions**

Build a logistic regression model with no resampling of data, but add the specification for upsampling. If you can't remember, learn more about [`trainControl()`](https://topepo.github.io/caret/model-training-and-tuning.html#control).

<codeblock id="03_09">

To upsample the training set within the call to `train()`, use `sampling = "up"` inside `trainControl()`.

</codeblock>

</exercise>

<exercise id="10" title="Cross-validation" type="slides">

<slides source="chapter3_10">
</slides>

</exercise>

<exercise id="11" title="Understanding cross-validation">

When you implement 10-fold cross-validation repeated 5 times, you...

<choice>
<opt text="randomly divide your training data into 50 subsets and train on 49 at a time (validating on the other subset), iterating through all 50 subsets for validation.">

If you divide your data into 50 subsets, that would be called 50-fold cross-validation. For most practical situations, 50 folds is overkill.

</opt>

<opt text="randomly divide your training data into 10 subsets and train on 9 at a time (validating on the other subset), iterating through all 10 subsets for validation. Then you repeat that process 5 times." correct="true">

Correct! ⚡️ Simulations and practical experience show that 10-fold cross-validation repeated 5 times is a great resampling approach for many situations. This approach involves randomly dividing your training data into 10 folds, or subsets or groups, and training on only 9 while using the other fold for validation. You iterate through all 10 folds being used for validation; this is one round of cross-validation. You can then repeat the whole process multiple, perhaps 5, times.

</opt>

<opt text="randomly divide your training data into 5 subsets and train on 4 at a time (validating on the other subset), iterating through all 5 subsets. Then you repeat that process 10 times.">

If you divide your data into 5 subsets, that would be called 5-fold cross-validation. In many practical situations, 5 folds is not enough to get the maximum performance improvement possible.

</opt>
</choice>

</exercise>

<exercise id="12" title="Training models with cross-validation">

You can build models both with the upsampling you implemented before, *and* the cross-validation we just discussed. Here, try 10-fold cross-validation repeated 2 times.

To allow the code in this exercise to evaluate in a short time, the training set in your environment is 2% of the real training set. Expect to see some warnings because of this.

**Instructions**

- Use `method = "repeatedcv"` to implement 10-fold cross-validation (10 folds or subsets is the default, but this can be changed) for the logistic regression model.
- Specify `repeats = 2` to repeat the 10-fold cross-validation 2 times.

<codeblock id="03_12_1">

Your call to `trainControl()` should look like `trainControl(method = "repeatedcv", repeats = 2, sampling = "up")`.

</codeblock>

**Instructions**

Now, train a random forest model by implementing 10-fold cross validation 2 times.

<codeblock id="03_12_2">

Similar to the logistic regression model, you need to use the `method` and `repeats` arguments inside `trainControl()`.

</codeblock>

</exercise>

<exercise id="13" title="Comparing model performance" type="slides">

<slides source="chapter3_13">
</slides>

</exercise>

<exercise id="14" title="Confusion matrix for your training data">

Let's start by seeing how these two models perform on your training data by looking at some confusion matrices. A confusion matrix tabulates how many examples in each class were correctly classified by a model. In this case study, it will show you how many voters were classified as voters and how many non-voters were classified as non-voters; the confusion matrix also shows you how many were classified into the wrong categories. 

Here we want to see how your model performed on the **training** data, the data the model used when it was trained. The models available in your environment were trained on all the training data, not just a subset, with 10-fold cross-validation repeated 5 times.

**Instructions**

Print the confusion matrix for the logistic regression model on the training data.

<codeblock id="03_14_1">

- Use the `conf_mat()` function to build a confusion matrix. 
- We aren't evaluating your models on the testing data yet, so use the `vote_train` data for all the arguments here.

</codeblock>

**Instructions**

Print the confusion matrix for the random forest model (`vote_rf`) on the training data.

<codeblock id="03_14_2">

Use `mutate()` to make a new column of `predict`ed values.

</codeblock>

</exercise>

<exercise id="15" title="Confusion matrix for your testing data">

Now, let's evaluate how the models perform on the testing data. This is what you use to estimate how your model will perform on new data.

**Instructions**

Print the confusion matrix for the logistic regression model on the training data.

- Generate a confusion matrix for the logistic regression model (`vote_glm`). 
- Instead of the `vote_train` data, now use the `vote_test` data.

<codeblock id="03_15_1">

- Find the predictions using `predict(vote_glm, vote_test)`.
- Choose the real voting status for the `truth` argument to `conf_mat()`, and the predicted voting status for `estimate`. 

</codeblock>

**Instructions**

- Generate a confusion matrix for the random forest model (`vote_rf`). 
- Instead of the `vote_train` data, now use the `vote_test` data.

<codeblock id="03_15_2">

- Use `mutate()` to make the new column with predicted values.
- Remember that `conf_mat()` is the function to find a confusion matrix.

</codeblock>

</exercise>

<exercise id="16" title="Which model is best?">

You have just spent a whole chapter of this course exploring how to predict voter turnout based on survey responses. Of the two types of models you tried, which is the better choice? Which do you expect to perform better on new data?

Which model performed better on the **testing** data?

<choice>
<opt text="Random forest">

Random forest models are very powerful and the random forest model had higher accuracy than the logistic regression model on the training data, but on the testing data, the random forest model could not identify any of the people who voted.

</opt>

<opt text="Logistic regression" correct="true">

Correct! Logistic regression is a simpler model, but in this case, it performed better on the testing data and you can expect it to do a better job predicting on new data.

</opt>
</choice>

</exercise>
