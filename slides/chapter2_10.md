---
type: slides
---

# Predicting remote status

Notes: Now that you have understood and implemented downsampling, or undersampling, we can finally get down to the business of building supervised machine learning models to predict which developers work remotely and which do not.

---

# Predicting remote status

### Classification models

- Logistic regression
- Decision tree

Notes: Unlike the first case study, when you built regression models to predict a numeric or continuous variable, in this case study you are going to build classification models, to predict the class: **remote** or **not remote**. We are going to stick with two methods to understand and implement classification models, logistic regression and a decision tree. 

There are lots of other options, and one of the great characteristics of using tidymodels for predictive modeling is that if you want to try something else, you can extend your work to new model types within the same framework. 💁

---

# Predicting remote status

### Logistic regression

```r
glm_spec <- logistic_reg() %>%
    set_engine("glm")
```

### Decision tree

```r
tree_spec <- decision_tree() %>%         
    set_engine("rpart") %>%      
    set_mode("classification") 
```


Notes: We are going to use model specifications from parsnip to set up the models. Notice here that one model is logistic regression while the other is a decision tree. How do we combine these model specifications with the data preprocessing we need to do from our recipe? 🤔

---

# Build a `workflow()`

```r
stack_wf <- workflow() %>%
    add_recipe(stack_recipe)
    
stack_wf %>%
    add_model(glm_spec)
```

```out
══ Workflow ══════════════════════════════════════════════════════════════════
Preprocessor: Recipe
Model: logistic_reg()

── Preprocessor ──────────────────────────────────────────────────────────────
1 Recipe Step

● step_downsample()

── Model ─────────────────────────────────────────────────────────────────────
Logistic Regression Model Specification (classification)

Computational engine: glm 
```

Notes: You have a few options for that, but one straightforward way is to use a [`workflow()`](https://tidymodels.github.io/workflows/), an object that makes it easier to carry around pieces of, well, modeling workflows! The components of a `workflow()` go together like LEGO blocks; you add a preprocessor like a recipe or a formula, and a model.

If you don't add one of those components (for example, `stack_wf` on this slide) the `workflow()` holds an empty spot ready for, say, the model. You may find this a convenient way to write your modeling code when you want to fit with the same preprocessor but different model specifications.

---

# Fit a `workflow()`

```r
stack_wf <- workflow() %>%
    add_recipe(stack_recipe)

stack_wf %>%
    add_model(tree_spec) %>%
    fit(data = stack_train)
```

Notes: A `workflow()` can be fit in much the same way a model can, and all the pieces are composable and pipeable. 🎉


---

# Evaluating your models 📏
  
```r
results %>%
    conf_mat(truth = remote, estimate = .pred_tree)
```

```out
            Truth
Prediction   Remote Not remote
  Remote         73        366
  Not remote     61        898
   
```

Notes: Classification models can be evaluated using a confusion matrix. This kind of matrix or table counts which examples were classified correctly and incorrectly. Notice here that with the decision tree model being evaluated with the testing data, 73 real remote developers were classified as remote, and 898 not remote developers were classified as not remote. The `conf_mat()` function in yardstick is very helpful!

---

# Evaluating your models 📏

```out
> accuracy(results, truth = remote, estimate = .pred_glm)
# A tibble: 1 x 3
  .metric  .estimator .estimate
  <chr>    <chr>          <dbl>
1 accuracy binary         0.657

> ppv(results, truth = remote, estimate = .pred_glm)
# A tibble: 1 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 ppv     binary         0.160

> npv(results, truth = remote, estimate = .pred_glm)
# A tibble: 1 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 npv     binary         0.941
```

Notes: Often you want other measures of model performance, though, in a format that will be friendlier to data frames, and for that you can use other functions from the yardstick package. 

Here we can see the overall accuracy, as well as the positive and negative predictive values, for the logistic regression model evaluated on the testing data. We'll pass three arguments to these functions: first, a data frame with real data on remote status and predicted remote status for our observations, and then the columns in that data frame that give us the true class and the predicted class for each developer in our data set.

---

# Let's practice! 👯

Notes: It's time for you to take this knowledge about model training and model evaluation and try your hand at it.









