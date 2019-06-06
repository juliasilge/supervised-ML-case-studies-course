---
type: slides
---

# Comparing model performance

Julia Silge
Data Scientist at Stack Overflow

Notes: Excellent job! You trained logistic regression models and random forest models with oversampling to account for class imbalance and cross-validation to get a more accurate estimate for model performance. Let's talk about that model performance now.

---

# Confusion matrix

```out
> confusionMatrix(predict(fit_glm, training),
+                 training$turnout16_2016)

Confusion Matrix and Statistics

              Reference
Prediction     Did not vote Voted
  Did not vote          149  1633
  Voted                  63  3510
                                          
               Accuracy : 0.6833          
                 95% CI : (0.6706, 0.6957)
    No Information Rate : 0.9604          
    P-Value [Acc > NIR] : 1               
                                          
                  Kappa : 0.0847          
 Mcnemar's Test P-Value : <2e-16          
                                          
            Sensitivity : 0.70283         
            Specificity : 0.68248         
         Pos Pred Value : 0.08361         
         Neg Pred Value : 0.98237         
             Prevalence : 0.03959         
         Detection Rate : 0.02782         
   Detection Prevalence : 0.33277         
      Balanced Accuracy : 0.69266         
                                          
       'Positive' Class : Did not vote    
```

Notes: If we start by looking at the confusion matrix for the training data and the logistic regression model, you can see that sensitivity and specificity (the true positive and true negative rates) are both around 70%, which means that most people are being classified into the right categories.


---

# Confusion matrix

```out
> confusionMatrix(predict(fit_rf, training),
+                 training$turnout16_2016)

Confusion Matrix and Statistics

              Reference
Prediction     Did not vote Voted
  Did not vote          212     5
  Voted                   0  5138
                                          
               Accuracy : 0.9991          
                 95% CI : (0.9978, 0.9997)
    No Information Rate : 0.9604          
    P-Value [Acc > NIR] : < 2e-16         
                                          
                  Kappa : 0.9879          
 Mcnemar's Test P-Value : 0.07364         
                                          
            Sensitivity : 1.00000         
            Specificity : 0.99903         
         Pos Pred Value : 0.97696         
         Neg Pred Value : 1.00000         
             Prevalence : 0.03959         
         Detection Rate : 0.03959         
   Detection Prevalence : 0.04052         
      Balanced Accuracy : 0.99951         
                                          
       'Positive' Class : Did not vote    
```

Notes: When we look at the confusion matrix for the training data and the random forest model, we see a much higher accuracy, and much higher values for sensitivity and specificity. Random forest models are much more powerful and in general, capable of much higher accuracy than logistic regression models. This model has done an almost perfect job of classifying the training data into these two categories. Almost too perfect, we might suspect. To evaluate how the models will perform on new data, we don't want to look at the training data; we want to look at the testing data.

---

# Confusion matrix for the testing data

```out
> confusionMatrix(predict(fit_glm, testing),
+                 testing$turnout16_2016)

Confusion Matrix and Statistics

              Reference
Prediction     Did not vote Voted
  Did not vote           37   428
  Voted                  15   857
                                          
               Accuracy : 0.6687          
                 95% CI : (0.6427, 0.6939)
    No Information Rate : 0.9611          
    P-Value [Acc > NIR] : 1               
                                          
                  Kappa : 0.0787          
 Mcnemar's Test P-Value : <2e-16          
                                          
            Sensitivity : 0.71154         
            Specificity : 0.66693         
         Pos Pred Value : 0.07957         
         Neg Pred Value : 0.98280         
             Prevalence : 0.03889         
         Detection Rate : 0.02767         
   Detection Prevalence : 0.34779         
      Balanced Accuracy : 0.68923         
                                          
       'Positive' Class : Did not vote   
```

Notes: When we look at the testing data and the logistic regression model, we see sensitivity and specificity that are about the same as what we saw with the training data. This means that this model is not overfit. We will expect this model to perform about this well on any new data.


---

# Confusion matrix for the testing data


```out
> confusionMatrix(predict(fit_rf, testing),
+                 testing$turnout16_2016)

Confusion Matrix and Statistics

              Reference
Prediction     Did not vote Voted
  Did not vote            0    14
  Voted                  52  1271
                                          
               Accuracy : 0.9506          
                 95% CI : (0.9376, 0.9616)
    No Information Rate : 0.9611          
    P-Value [Acc > NIR] : 0.9767          
                                          
                  Kappa : -0.0168         
 Mcnemar's Test P-Value : 5.254e-06       
                                          
            Sensitivity : 0.00000         
            Specificity : 0.98911         
         Pos Pred Value : 0.00000         
         Neg Pred Value : 0.96070         
             Prevalence : 0.03889         
         Detection Rate : 0.00000         
   Detection Prevalence : 0.01047         
      Balanced Accuracy : 0.49455         
                                          
       'Positive' Class : Did not vote   
```

Notes: The same, sadly, cannot be said for the random forest model. Notice that here with the testing data, it did not correctly predict for any of the people who did not vote. What we're seeing here is evidence of dramatic overfitting, despite the fact that we used cross-validation. For the amount of data we have available to train this model, the power of a random forest ends up resulting in memorization of the features of the training set, instead of building a useful predictive model.


---

# Comparing model performance

```out
> library(yardstick)
> 
> sens(testing_results, truth = turnout16_2016, estimate = `Logistic regression`)
[1] 0.7115385
>
> spec(testing_results, truth = turnout16_2016, estimate = `Logistic regression`)
[1] 0.6669261
> sens(testing_results, truth = turnout16_2016, estimate = `Random forest`)
[1] 0
>
> spec(testing_results, truth = turnout16_2016, estimate = `Random forest`)
[1] 0.9891051
```

Notes: When we look here at some of the individual model metrics, you can see this again, that the sensitivity, or true positive rate, is dramatically lower for the random forest model than for the logistic regression model when evaluated on the testing data. Notice that this is the first time that this has happened in this course. In the first and second case studies we did, the more powerful machine learning algorithm outperformed the simpler model.

---

# Let's finish this case study!

Notes: Before we wrap up this case study, it's time for you to evaluate these models for yourself.
