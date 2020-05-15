---
title: 'Chapter 4: But what do the nuns think?'
description:
  'The last case study in this course uses an extensive survey of Catholic nuns fielded in 1967 to once more put your practical machine learning skills to use. You will predict the age of these religious women from their responses about their beliefs and attitudes.'
prev: /chapter3
next: /chapter1
type: chapter
id: 4
---

<exercise id="1" title="Surveying Catholic sisters in 1967" type="slides">

<slides source="chapter4_01">
</slides>

</exercise>

<exercise id="2" title="Choose an appropriate model">

In this case study, you will predict the age of Catholic nuns from their answers on a survey fielded in 1967 focusing on questions about social and religious issues. What kind of model will you build?

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

To predict a continuous, numeric quantity like age, use regression models.

</opt>
</choice>

</exercise>

<exercise id="3" title="Visualize the age distribution">

The first step before you start modeling is to explore your data, and we are going to spend a little more time on this step in this last case study. To start with, check out the distribution of ages for the respondents in this survey. 📊 (Keep in mind throughout this case study that the data you have in your environment is one quarter of the real survey data.)

**Instructions**

- Call `glimpse()` on `sisters67` to take a look at the structure of the data. Notice how many columns there are, and what their characteristics are.
- Plot a histogram of `age`.

<codeblock id="04_03">

You can build a histogram using [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).

</codeblock>

</exercise>

<exercise id="4" title="Tidy the survey data">

Embracing [tidy data principles](https://tidyverse.tidyverse.org/articles/manifesto.html) is a powerful option for exploratory data analysis. When your data is tidy, you can quickly iterate in getting to know your data better and making exploratory plots. Let's transform this wide data set into a tidy data frame with one observation per row, and then check out some characteristics of this subset of the original survey.

Note: There is a column called `sister` in this dataset that is an identifier for each survey respondent. We are removing this column in the exercise using [`select()`](https://dplyr.tidyverse.org/reference/select.html).

**Instructions**

- Use the [`pivot_longer()`](https://tidyr.tidyverse.org/reference/pivot_longer.html) function to transform the wide data set with each survey question in a separate column to a narrow, tidy data set with each survey question in a separate row.
- View the structure of this tidy data set using `glimpse()`.

<codeblock id="04_04_1">

When you implement `... %>% pivot_longer(-age, names_to = "key", values_to = "value")`, you transform the data set from wide (non-tidy) to narrow (tidy). The argument `-age` specifies that we want to keep the `age` column for each row.

</codeblock>

Next look at question agreement overall.

**Instructions**

- Group by `age` and summarize the `value` column to see how the overall agreement with all questions varied by age.
- Count the `value` column to check out how many respondents agreed or disagreed overall.

<codeblock id="04_04_2">

- Call the `group_by()` function first, and then `summarize()`. 
- To count the `value` column, use `count(value)`.

</codeblock>

</exercise>

<exercise id="5" title="Exploratory data analysis with tidy data" type="slides">

<slides source="chapter4_05">
</slides>

</exercise>

<exercise id="6" title="Visualize agreement with age">

The tidied version of the survey data that you constructed is available in your environment. You have many options at your fingertips with this tidy data now. Make a plot that shows how agreement on a subset of the questions changes with age.
 📉
In this exercise, we are using [`filter()`](https://dplyr.tidyverse.org/reference/filter.html) to subset the data to just a subset of the questions on the survey to look at.

**Instructions**

- Group by two variables, `key` and `value`, so you can calculate an average age for each answer to each question.
- Summarize for each grouping to find an average age.
- Choose the correct `geom` to make a line plot.

<codeblock id="04_06">

- You want to `group_by(key, value)` and `summarize(age)` to find the average age for each ansewr to each question.
- You can build a line plot using [`geom_line()`](https://ggplot2.tidyverse.org/reference/geom_path.html).

</codeblock>

</exercise>

<exercise id="7" title="Training, validation, and testing data">

It's time to split your data into different sets now. You've done this three times already in this course, but in this last case study we are also going to create a validation set. Using a validation set is a good option when you have enough data (otherwise, you can use resampling). 

**Instructions**

- Create two data partitions: 
    - Specify one to split between testing and everything else.
    - Specify another one to split between validation and training.

<codeblock id="04_07">

The [`initial_split()`](https://tidymodels.github.io/rsample/reference/initial_split.html) function splits off the testing set, and then [`validation_split()`](https://tidymodels.github.io/rsample/reference/validation_split.html) creates a single resample to be used for validation.

</codeblock>

</exercise>

<exercise id="8" title="Using your validation set">

This new validation set you just created will be used to...

<choice>
<opt text="train your models.">

Training is done with the training set.

</opt>

<opt text="compare models you have trained and choose which one to use." correct="true">

A validation test is used to compare models or tune hyperparameters.

</opt>

<opt text="do the final evaluation step where you estimate the performance of your model on new data.">

The final evaluation is done with the testing set. It is important to do this final evaluation with a separate data set so that you do not underestimate your error on new data.

</opt>
</choice>

</exercise>

<exercise id="9" title="Tune model hyperparameters" type="slides">

<slides source="chapter4_09">
</slides>

</exercise>

<exercise id="10" title="Identify tuning parameters">

It's time to build a modeling `workflow()` for this last dataset. We aren't going to fit this dataset just once, but instead _many_ times! We are going to use this `workflow()` to tune hyperparameters both in our model specification and our preprocessing recipe.

**Instructions**

Let's start with our preprocessing tuning.

- Add two preprocessing steps to this recipe, first to normalize and them to implement PCA.
- Specify that we want to `tune()` the number of principal components.

<codeblock id="04_10_1">

- To normalize, use `step_normalize()`. 
- To implement PCA, use `step_pca()`.

</codeblock>

Next let's build our model specification with tuning.

**Instructions**

- Start by specifying that we want to train a `decision_tree()` model.
- Add the two parameters we want to tune, cost complexity and tree depth.

<codeblock id="04_10_2">

The variables for these parameters are `cost_complexity` and `tree_depth`.

</codeblock>

Finally, let's put our recipe and model specification together in a `workflow()`, for ease of use.

**Instructions**

- First set up a `workflow()` object.
- Add the recipe to the `workflow()`.
- Add the model to the `workflow()`

<codeblock id="04_10_3">

You start off any workflow with the `workflow()` function.

</codeblock>

</exercise>


<exercise id="11" title="Create a tuning grid">

Let's create a grid! 💃To tune our hyperparameters, we need a set of possible values for each parameter to try. In this case study, we'll work through a regular grid of hyperparameter values.

**Instructions**

- Use the function `grid_regular()` to create a grid of tuning parameters.
- Add the function for the tree depth tuning parameter, after the cost complexity tuning parameter function.

<codeblock id="04_11">

Use the function `tree_depth()` for the third tuning parameter in the grid.

</codeblock>

</exercise>

<exercise id="12" title="Time to tune">

It's time to finally tune! The recipe, model, workflow, and grid are built here for you, and now you can put them together to find out which combination of parameters results in the best performance. (There is a smaller grid created here so the tuning will evaluate faster.)

**Instructions**

- Use the function `tune_grid()` to tune your model.
- For the first argument, add your tuneable workflow.
- For the third argument, add the grid of possible parameters.

<codeblock id="04_12">

Your function should be `tune_grid(tree_wf, sisters_val, tree_grid)`.

</codeblock>

</exercise>

<exercise id="13" title="Visualize tuning results">

Now that you have trained models for many possible tuning parameters, let's explore the results.

(The results available in your environment were trained over a larger grid of tuning parameters.)

**Instructions**

- As a first step, use the function `collect_metrics()` to extract the performance metrics from the tuning results.
- In the call to `aes()`, put `cost_complexity` on the x-axis and assign `tree_depth` to the color aesthetic.

<codeblock id="04_13">

Set up your aesthetic call as `aes(cost_complexity, mean, color = tree_depth)`.

</codeblock>

</exercise>

<exercise id="14" title="Find the best parameters">

You just visualized the tuning results, but you can also select the best set of tuning parameters and update your `workflow()` with these values.

**Instructions**

- Use the function `select_best()` to extract the hyperparameters with the lowest RMSE from the tuning results.
- Pipe the original workflow object to `finalize_workflow()` with that best decision tree as an argument, to update it.

<codeblock id="04_14">

After you execute `tree_wf %>% finalize_workflow(best_tree)`, the output can be used to predict on new data.

</codeblock>

</exercise>

<exercise id="15" title="Use the testing data">

We haven't touched the testing data throughout this analysis, but here at the very end, we can come back to it and estimate how well our model will perform on new data. If all has gone well, our performance metrics such as RMSE will be about the same as from the validation set, indicating that we did not overfit during our tuning procedure. Let's use the `last_fit()` function to fit to the entire training set and evaluate on the testing set.

**Instructions**

- Fit to the training set and evaluate on the testing set using `last_fit()`. 
- Access the performance metrics for the testing set using `collect_metrics()`.

<codeblock id="04_15">

You don't need to specify anything to get the testing set metrics; you only need to use the `collect_metrics()` function.

</codeblock>

</exercise>

<exercise id="16" title="Wrapping up" type="slides">

<slides source="chapter4_16">
</slides>

</exercise>
