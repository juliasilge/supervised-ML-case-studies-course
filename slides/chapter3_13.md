---
type: slides
---

# Comparing model performance

Notes: Excellent job! You trained logistic regression models and random forest models with oversampling to account for class imbalance and cross-validation to get a more accurate estimate for model performance. 😎 Let's talk about that model performance now.

---

# Confusion matrix

```r
vote_train %>%
    mutate(`Logistic regression` = predict(vote_glm, vote_train)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Logistic regression")
```
```out
              Truth
Prediction     Did not vote Voted
  Did not vote          160  1557
  Voted                  62  3575
```

Notes: If we start by looking at the confusion matrix for the training data and the logistic regression model, you can see that sensitivity and specificity (the true positive and true negative rates) are both around 70%, which means that most people are being classified into the right categories.


---

# Confusion matrix

```r
vote_train %>%
    mutate(`Random forest` = predict(vote_rf, vote_train)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Random forest")
```

```out
              Truth
Prediction     Did not vote Voted
  Did not vote          222     0
  Voted                   0  5132   
```

Notes: When we look at the confusion matrix for the training data and the random forest model, we see much higher performance. Random forest models are much more powerful and in general, capable of much higher accuracy than logistic regression models. This model has done a perfect job of classifying the training data into these two categories. Almost *too* perfect, we might suspect. 😒 To evaluate how the models will perform on new data, we don't want to look at the training data; we want to look at the **testing data**.

---

# Confusion matrix for the testing data

```r
vote_test %>%
    mutate(`Logistic regression` = predict(vote_glm, vote_test)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Logistic regression")
```

```out
              Truth
Prediction     Did not vote Voted
  Did not vote           28   359
  Voted                  14   937
```

Notes: When we look at the testing data and the logistic regression model, we see performance that is about the same as what we saw with the training data. This means that this model is not overfit. We will expect this model to perform about this well on any new data. 😊


---

# Confusion matrix for the testing data


```r
vote_test %>%
    mutate(`Random forest` = predict(vote_rf, vote_test)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Random forest")
```

```out
              Truth
Prediction     Did not vote Voted
  Did not vote            0     3
  Voted                  42  1293
```

Notes: The same, sadly, cannot be said for the random forest model. Notice that here with the testing data, it did not correctly predict for any of the people who did not vote. 😱 What we're seeing here is evidence of dramatic overfitting, despite the fact that we used cross-validation. For the amount of data we have available to train this model, the power of a random forest ends up resulting in memorization of the features of the training set, instead of building a useful predictive model.


---

# Comparing model performance

```
> library(yardstick)
> 
> sens(testing_results, truth = turnout16_2016, estimate = `Logistic regression`)
# A tibble: 1 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 sens    binary         0.667
> 
> spec(testing_results, truth = turnout16_2016, estimate = `Logistic regression`)
# A tibble: 1 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 spec    binary         0.723
> 
> sens(testing_results, truth = turnout16_2016, estimate = `Random forest`)
# A tibble: 1 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 sens    binary             0
> 
> spec(testing_results, truth = turnout16_2016, estimate = `Random forest`)
# A tibble: 1 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 spec    binary         0.998
```

Notes: When we look here at some of the individual model metrics, you can see this again, that the sensitivity, or true positive rate, is dramatically lower for the random forest model than for the logistic regression model when evaluated on the testing data. Notice that this is the first time that this has happened in this course. In the first and second case studies we did, the more powerful machine learning algorithm outperformed the simpler model.

---

# Let's finish this case study!👏

Notes: Before we wrap up this case study, it's time for you to evaluate these models for yourself.
