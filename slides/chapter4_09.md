---
type: slides
---

# Tune model hyperparameters

Julia Silge
Data Scientist at Stack Overflow

Notes: You have prepared training, validation, and test sets and now it's time to build predictive models.

---

# What is a model hyperparameter?

```r
tree_spec <- decision_tree(
  cost_complexity = tune(),
  tree_depth = tune()
) %>% 
  set_engine("rpart") %>% 
  set_mode("regression")
```

Notes: In this last case study, you are going to work with model hyperparameters for the first time in this course. Some model parameters cannot be learned directly from a dataset during model training; these kinds of parameters are called **hyperparameters**. 💥 Some examples of hyperparameters include the number of predictors that are sampled at splits in a tree-based model (we call this `mtry` in tidymodels) or the learning rate in a boosted tree model (we call this `learn_rate`). 

Instead of learning these kinds of hyperparameters during model training, we can estimate the best values for these values by training many models on a resampled data set (like the validation set you just created) and measuring how well all these models perform. This process is called **tuning**.

You can identify which parameters to `tune()` in a model specification as shown here. Let's build a decision tree model to predict age for our nuns, and tune the cost complexity and the maximum tree depth.

---

# Preprocessing and tuning

```r
sisters_recipe <- recipe(age ~ ., data = sisters_other) %>% 
  step_normalize(all_predictors()) %>%
  step_pca(all_predictors(), num_comp = tune())
```

Notes: Model hyperparameters aren't the only things you can tune. You can also tune steps in your preprocessing pipeline. This recipe has two steps:

- First, this recipe centers and scales all those numeric predictors we have in this dataset, cataloging the nuns' responses to the survey questions.
- Second, this recipe implements principal component analysis on these same predictors. Except... this recipe identifies that we _want_ to implement PCA and we aren't sure how many predictors we should use. We want to choose the best 🏆 number of predictors. 

---

# Grid of tuning parameters

```r
grid_regular(num_comp(c(3, 12)),
             cost_complexity(),
             tree_depth(),
             levels = 5)
```

```out
# A tibble: 125 x 3
   num_comp cost_complexity tree_depth
      <int>           <dbl>      <int>
 1        3    0.0000000001          1
 2        5    0.0000000001          1
 3        7    0.0000000001          1
 4        9    0.0000000001          1
 5       12    0.0000000001          1
 6        3    0.0000000178          1
 7        5    0.0000000178          1
 8        7    0.0000000178          1
 9        9    0.0000000178          1
10       12    0.0000000178          1
```

Notes: You have a couple of options for how to choose which possible values for the tuning parameters to try. One option is to set up a grid of possible parameter values.

Here, we are using default ranges for cost complexity and tree depth, and we are going to try 3 to 12 principal components. When we set `levels = 5`, we are saying we want five levels for each parameter, which means there will be 125 (`5 * 5 * 5`) total models to try. 

You can use the function `tune_grid()` to fit all these models; you can tune either a workflow or a model specification with a set of resampled data, such as the validation set you created (i.e. a single resample).

---

![Validation](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/validation.png?raw=true)

Notes: You train these 125 possible models on the training data and use the validation data to compare all the results in terms of performance. We won't use the testing data until the very end of our modeling process, when we use it to estimate how our model will perform on new data.

---

# Why three data partitions?

Don't overestimate how well your model is performing! 🙅

Notes: For some modeling use cases, an approach with three data partitions is overkill, perhaps a bit too much, but if you have enough data that you can use some of these powerful machine learning algorithms or techniques, the danger you face is underestimating your uncertainty for new data if you estimate it with data that you used to pick a model. 

To get a reliable estimate from tuning, for example, you need to use another heldout dataset for assessing the models, either a validation set or a set of simulated datasets created through resampling.

---

![tune results](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/tune_results.png?raw=true)


Notes: This dataset of extensive survey responses from Catholic nuns in the 1960s is a great demonstration of all of these issues. You will use your validation set to find which values of the parameters (cost complexity, tree depth, and number of principal components) result in the highest R-squared and lowest RMSE. Notice here that we get the best results with a tree depth of 4 and 5 principal components.

As you work through the final set of exercises, you will see all of this come together, along with all the other practical predictive modeling skills we've explored in this course.

---

# Let's practice! ✨

Notes: It's time to finish out this course with the final models that you need to train and evaluate.

