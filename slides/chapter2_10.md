---
type: slides
---

# Predicting remote status

Julia Silge
Data Scientist at Stack Overflow

Notes: Now that you have understood and implemented upsampling, or oversampling, we can finally get down to the business of building supervised machine learning models to predict which developers work remotely and which do not.

---

# Predicting remote status

### Classification models

- Logistic regression
- Random forest

Notes: Unlike the first case study, when you built regression models to predict a numeric or continuous variable, in this case study you are going to build classification models, to predict the class: remote or not remote. We are going to stick with two methods to understand and implement classification models, logistic regression and random forest. There are lots of other options, and one of the great characteristics of using caret for predictive modeling is that if you want to try something else, you can extend your work to new model types within the same framework.

---

# Predicting remote status

### Logistic regression

```r
stack_glm <- train(Remote ~ ., method = "glm", family = "binomial",
                   data = training,
                   trControl = trainControl(method = "boot",
                                            sampling = "up"))
```

### Random forest

```r
stack_rf <- train(Remote ~ ., method = "rf", 
                  data = training,
                  trControl = trainControl(method = "boot",
                                           sampling = "up"))
```


Notes: We are going to use the train() function from caret to set up the models. Notice here that one model is logistic regression while the other is random forest, but for both we are implementing bootstrap resampling and upsampling to deal with the class imbalance of remote developers in our dataset.

Bootstrap resampling can take a while so when you implement this code in an exercise, you'll have a subset of the data to work with in your environment.

---

# Evaluating your models

```out
> confusionMatrix(predict(stack_glm, testing),
+                 testing$Remote)

Confusion Matrix and Statistics

            Reference
Prediction   Remote Not remote
  Remote         94        446
  Not remote     49        808
                                          
               Accuracy : 0.6457          
                 95% CI : (0.6199, 0.6708)
    No Information Rate : 0.8976          
    P-Value [Acc > NIR] : 1               
                                          
                  Kappa : 0.1353          
 Mcnemar's Test P-Value : <2e-16          
                                          
            Sensitivity : 0.65734         
            Specificity : 0.64434         
         Pos Pred Value : 0.17407         
         Neg Pred Value : 0.94282         
             Prevalence : 0.10236         
         Detection Rate : 0.06729         
   Detection Prevalence : 0.38654         
      Balanced Accuracy : 0.65084         
                                          
       'Positive' Class : Remote          
                                   
```

Notes: Classification models can be evaluated using a confusion matrix. This kind of matrix or table counts which examples were classified correctly and incorrectly. Notice here that with the logistic regression model being evaluated with the testing data, 94 real remote developers were classified as remote, and 808 not remote developers were classified as not remote. The confusionMatrix() function in caret prints out a lot of other useful measures, but.

---

# Evaluating your models

```out
library(yardstick)

> accuracy(testing_results, truth = Remote, estimate = `Logistic regression`)
[1] 0.6456693

> ppv(testing_results, truth = Remote, estimate = `Logistic regression`)
[1] 0.1740741

> npv(testing_results, truth = Remote, estimate = `Logistic regression`)
[1] 0.9428238
```

Notes: ... often you want to get those values out separately, in a format that will be friendlier to data frames, and for that you can use the yardstick package. Here we can see the overall accuracy, as well as the positive and negative predictive values for the logistic regression model evaluated on the testing data. We'll pass three arguments to these functions: first, a data frame with real data on remote status and predicted remote status for our observations, and then the columns in that data frame that give us the true class and the predicted class for each developer in our data set.

---

# Let's practice!

Notes: It's time for you to take this knowledge about model training and model evaluation and try your hand at it.









