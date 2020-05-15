---
type: slides
---

# Evaluating models with resampling


Notes: You just trained models one time on the whole training set and then evaluated them on the testing set. Statisticians have come up with a slew of approaches to evaluate models in better ways than this; many important ones fall under the category of **resampling**.

The idea of resampling is to create simulated data sets that can be used to estimate the performance of your model, say, because you want to compare models. You can create these resampled data sets instead of using either your training set (which can give overly optimistic results, especially for powerful ML algorithms) or your testing set (which is extremely valuable and can only be used once or at most twice).

---

# Bootstrap resampling

Sample with replacement from the original dataset

Notes: The first resampling approach we're going to try in this course is called the bootstrap. Bootstrap resampling means drawing with replacement from our original dataset and then fitting on that dataset.

Let's think about...cars! 🚗🚌🚙🚕 

Let's say our training dataset has 900 cars in it. 

---


![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/bootstrap.png?raw=true)

Notes: To make a bootstrap sample, we draw with replacement 900 times from that training data to get the same size sample that we started with. 

Since we're drawing with replacement, we will probably draw some cars more than once. We then fit our model on that new set of 900 cars that contains some duplicates, and evaluate the model on the cars that are not included in the new set of 900. 

Then we do that again.

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/bootstrap2.png?raw=true)


Notes: We draw 900 times from the training dataset with replacement again and fit another model. We repeat that some number of times, look at all the models we fit on the bootstrap samples, determine each model's individual performance by evaluating on the cars that were not included in each bootstrap resample, and then take an average of the performance metrics.

This approach does take longer, obviously, than fitting on the data one time. In your exercise, you will have a subset of the complete dataset to try this out with.

---

# Bootstrap resampling with tidymodels

```r
bootstraps(car_train)
```

```out
# Bootstrap sampling 
# A tibble: 25 x 2
   splits            id         
   <list>            <chr>      
 1 <split [916/328]> Bootstrap01
 2 <split [916/347]> Bootstrap02
 3 <split [916/331]> Bootstrap03
 4 <split [916/333]> Bootstrap04
 5 <split [916/346]> Bootstrap05
 6 <split [916/329]> Bootstrap06
 7 <split [916/320]> Bootstrap07
 8 <split [916/342]> Bootstrap08
 9 <split [916/339]> Bootstrap09
10 <split [916/334]> Bootstrap10
# … with 15 more rows
```

Notes: I am very happy to be able to tell you that creating resamples is not too complicated with tidymodels. There are functions such as `bootstraps()` and similar for other types of resampling. The default behavior is to do 25 bootstrap resamplings, but you can change this if you want to. Notice that we resampled the `car_train` dataset, which is the _training_ data.

The column `splits` is of type `list`. Instead of containing numbers or characters, this column contains lists. Each split in that column keeps track of which of the original data points are in the analysis set for that resample.

---

# Evaluating models with resampling

```r
lm_mod %>%
    fit_resamples(
        log(MPG) ~ .,
        car_boot,
        control = control_resamples(save_pred = TRUE)
    )
```

Notes: Once you have created a set of resamples, you can use the function `fit_resamples()` to fit a model to each resample and compute performance metrics for each. 

The code on this slide shows how to fit our model specification `lm_mod` to the 25 bootstrap resamples in `car_boot`. This will fit our regression model 25 times, each time to a different bootstrapped version of the training data. We also determine how well our regression model performed 25 times, each time on the smaller subset of training data set aside when fitting. The fitted models themselves are just thrown away and not stored in the output, because they are only used for computing performance metrics. 

To fit the random forest to these resamples and find performance metrics, we would use `rf_mod` instead.


---

# Comparing predicted to real values ⛽ 

```out
   `log(MPG)` .pred_lm .pred_rf
        <dbl>    <dbl>    <dbl>
 1       2.71     2.77     2.84
 2       3.37     3.45     3.38
 3       2.94     2.96     2.91
 4       2.89     2.94     2.99
 5       3.14     3.26     3.24
 6       3.22     3.39     3.47
 7       3.40     3.31     3.35
 8       3.22     3.31     3.19
 9       2.89     2.79     2.87
10       3.22     3.35     3.26
```

Notes: We will not save the fitted models but we *are* going to save our predictions in `fit_resamples()` using `save_pred = TRUE`. This is so we can be especially clear about what it is that we are comparing during this process. 

Each car has a real fuel efficiency as reported by the Department of Energy and then we have built models that predict fuel efficiency for each car. When we evaluate a model, we are calculating how far apart each *predicted* value is from each *real* value.

---

# Visualizing model predictions

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/cars_metrics.png?raw=true)

Notes: In this lesson, you also are going to visualize these differences, like you see here. The x-axis has the actual fuel efficiency and the y-axis has the predicted fuel efficiency for each kind of model. 

The difference between linear regression and random forest isn't huge here, but in this case, we can see visually that the random forest model is performing better. The slope for the random forest model is closer to the dotted line (the `slope = 1` line) and the spread around the line is smaller for the random forest model.

---

# Let's practice!⚡️

Notes: OK, now it's your turn. Let's see if you can evaluate these kinds of models with bootstrap resampling and discover which model performs better.











