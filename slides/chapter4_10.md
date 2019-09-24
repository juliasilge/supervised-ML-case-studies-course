---
type: slides
---

# Predicting age with supervised machine learning

Julia Silge
Data Scientist at Stack Overflow

Notes: You have prepared training, validation, and test sets and now it's time to build predictive models.

---

# Build models

- `"rpart"` 
- `"xgbLinear"` 
- `"gbm"` 

Notes: In this last case study, you are going to experiment with three new model types, [all available in caret](https://topepo.github.io/caret/available-models.html), that we haven't had a chance to try out yet in this course. The first kind, that you will train in an exercise, is a CART model, implemented in the rpart package. This is a moderately simple tree-based model. 

The second kind of model, that we will provide in your environment as a trained model, is an extreme gradient boosting model, often called xgboost. 

The third type of model is a different implementation of gradient boosting regression. Gradient boosting involves taking a whole lot of very simple predictive models (usually trees, again) and then ensembling them to get a really good predictive model. They can take a long time to train, so we'll provide you with already trained models to evaluate. These kinds of models do have tuning parameters, but understanding those in detail is beyond the scope of this course. We're going to stick with the defaults.

---

# Choosing between multiple models

```r
## CART
sisters_cart <- train(age ~ ., method = "rpart", data = sisters_train)

## xgboost
sisters_rf <- train(age ~ ., method = "xgbLinear", data = sisters_train)

## gbm
sisters_gbm <- train(age ~ ., method = "gbm", data = sisters_train)
```

Notes: You will use your training dataset when you train the models, as you have throughout this course. In the other case studies, we stuck with just two kinds of models and didn't explore a lot of ways to tune them. We trained the models using the training set, and then tested them using the testing test. 

If you stop 🛑 to think  aout what we were doing when we used the test set, though, you'll realize there is more than one thing going on. We looked at model performance on the test set, decided which model was best, and then assumed that same model performance would apply to new data.

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/validation.png?raw=true)

Notes: Once you start exploring multiple kinds of models, say linear regression plus random forest plus gradient boosting plus maybe trying out different kinds of resampling techniques, then you need to take a step back and recognize that you need three datasets.

You will train your models on the training data, use the validation data to compare all these different models you are trying out, and then estimate uncertainty or error using the test data, which is a separate set of data that you have not touched yet in this whole process.

---

# Why three data partitions?

Don't overestimate how well your model is performing! 🙅

Notes: In some cases, this approach is overkill, just too much and not appropriate, but if you have enough data that you can use some of these powerful machine learning techniques, the danger you face is underestimating your uncertainty for new data if you estimate it with data that you used to pick a model. To get the best estimate for prediction errors or prediction uncertainty, you need to use another heldout dataset.

---

# Why three data partitions?

```
> sisters_validate %>%
+     mutate(prediction = predict(sisters_xg, sisters_validate)) %>%
+     rmse(truth = age, estimate = prediction)
[1] 13.27101
>
> sisters_text %>%
+     mutate(prediction = predict(sisters_xg, sisters_text)) %>%
+     rmse(truth = age, estimate = prediction)
[1] 13.36945
```

Notes: This dataset of extensive survey responses from Catholic nuns in the 1960s is a great demonstration of all of these issues. As you work through the final set of exercises, you will see all of this come together, along with all the other practical predictive modeling skills we've explored in this course.

---

# Let's practice! ✨

Notes: It's time to finish out this course with the final models that you need to train and evaluate.

