---
type: slides
---

# Evaluate model performance

Notes: Excellent job! You preprocessed this data, built a modeling workflow, and created cross-validation folds to evaluate model performance. 😎 

Let's talk about that model performance now, how to set _non-default performance metrics_ and save _predictions_ from resampled data.

---

# Evaluate models with resampling

```r
vote_wf %>%
    fit_resamples(
        vote_folds,
        metrics = metric_set(roc_auc, sensitivity, specificity),
        control = control_resamples(save_pred = TRUE)
    )
```    

Notes: Just like in our first case study, we can use the function `fit_resamples()` to fit a model (a workflow in this case, actually, that holds both a preprocessor and a model specification) to each cross-validation fold and compute performance metrics. The code shown on this slide will fit our workflow `vote_wf` to the cross-validation folds in `vote_folds` and determine how well the model performed each time.

The fitted models themselves are not kept or stored because they are only used for computing performance metrics. However, we are saving the predictions with `save_pred = TRUE` so we can build a confusion matrix, and we have also set _specific performance metrics_ to be computed (instead of the defaults) with `metric_set(roc_auc, sensitivity, specificity)`. We will have: 

- the area under the ROC curve, 
- sensitivity, and 
- specificity.

---

# Metrics for classification models

```r
collect_metrics(glm_res)
```
```out
# A tibble: 3 x 5
  .metric .estimator  mean     n std_err
  <chr>   <chr>      <dbl> <int>   <dbl>
1 roc_auc binary     0.726    10 0.0131 
2 sens    binary     0.639    10 0.0330 
3 spec    binary     0.706    10 0.00810
```

Notes: If we start by looking at the metrics for the logistic regression model, you can see that sensitivity and specificity (the true positive and true negative rates) are both around 0.6 or 0.7, which means that most people are being classified into the right categories but we are not getting fantastic results with this model.

---

# Metrics for classification models

```r
collect_metrics(rf_res)
```
```out
# A tibble: 3 x 5
  .metric .estimator  mean     n  std_err
  <chr>   <chr>      <dbl> <int>    <dbl>
1 roc_auc binary     0.746    10 0.0159  
2 sens    binary     0        10 0       
3 spec    binary     1.00     10 0.000193
```

Notes: When we look at the metrics for the random forest model, we see that the AUC is higher, but sensitivity (the true positive rate, or recall) has dropped to zero! 😱 The random forest model is not able to identify **any** of the people who did not vote.  

What we're seeing here is evidence of dramatic overfitting, despite the fact that we used cross-validation. For the amount of data we have available to train this model, the power of a random forest ends up resulting in memorization of the features of the training set, instead of building a useful predictive model. Our choice to use upsampling (where the same small number of positive cases were drawn from again and again) likely made this worse!

Notice that this is the first time that this has happened in this course. In the first and second case studies we did, the more powerful machine learning algorithm outperformed the simpler model.
---

# Confusion matrix

```r
vote_final <- vote_wf %>%
    last_fit(vote_split)

vote_final %>% 
    collect_predictions() %>% 
    conf_mat(turnout16_2016, .pred_class)
```

```out
              Truth
Prediction     Did not vote Voted
  Did not vote           25   372
  Voted                  23   918
```

Notes: The logistic regression model will likely be the best option, so we can evaluate its performance on the testing data. We can use the [`last_fit()`](https://tidymodels.github.io/tune/reference/last_fit.html) function with a workflow to fit to the entire training set and evaluate on the testing set. You only need to give this function the **split** object!

We can see that we did a better job identifying the people who voted than those who did not.

---

# Let's finish this case study!👏

Notes: Before we wrap up this case study, it's time for you to evaluate these models for yourself.
