---
type: slides
---

# Dealing with imbalanced data ⚖️


Notes: You just took this data about which developers work remotely and which do not, and split it into testing and training sets. Before we go any further, we need to talk about the class imbalance in our dataset.

---

# Class imbalance

Class imbalance

- is a common problem!
- often negatively affects the performance of your model 🙀

Notes: It's good that we're going to talk about class imbalance because it comes up a lot in real life. In many practical, real-world situations, there are a lot more of one kind of category in a dataset than another. In our example here, there are about ten times more non-remote developers than there are remote developers. What can happen in a situation like this is that a machine learning model will always predict the majority class or otherwise exhibit poor performance on the metrics that we care about.

---

# Class imbalance

```r
stack_overflow %>% 
    count(remote)
```

```out
# A tibble: 2 x 2
  remote         n
  <fct>      <int>
1 Remote       718
2 Not remote  6273
```

Notes: This is in fact what happens with our dataset here (I know because I tested it out ✅) so we need to do something to address this imbalance. There are a variety of options available to you, which vary from quite simple to more complex, and we're going to start with a simple option.

---

# Downsampling

- Remove some of the majority class so it has less effect on the predictive model
- Randomly remove examples from the majority class until it is the same size as the minority class

Notes: In this case study, we're going to implement **downsampling**, also known as undersampling. With this approach, we randomly remove observations from the majority class until it's the same size as the minority class and both classes can have the same effect on the machine learning model we're training. 

Are we really going to throw out a large percentage of our data here?! 😱 Yes! We do this because such an approach can be helpful at producing a useful model that can recognize both classes, instead of only one.

---

![](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/downsample1.png?raw=true)

Notes: In our case study, there are roughly ten times more non-remote developers compared to the remote developers.


---

![](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/downsample2.png?raw=true)

Notes: When we implement downsampling, we remove some of the non-remote developers until the proportion is equal and the classes are balanced. This approach is simple to implement and understand, but there are other more complex approaches to class imbalance available as well.

---

# Implementing downsampling

```r
stack_recipe <- recipe(remote ~ ., data = stack_train) %>% 
    step_downsample(remote)
```

Notes: Downsampling is an example of a preprocessing step for modeling. In tidymodels, you can preprocess your data using [recipes](https://tidymodels.github.io/recipes/). The recipe shown in this slide only has one preprocessing step (downsampling), but you can implement many steps on one dataset during preprocessing. There are an enormous number of different kinds of preprocessing you can do, from creating indicator variables to implementing principal component analysis to extracting date features and more.

---

# Implementing downsampling


```r
stack_prep <- prep(stack_recipe)

juice(stack_prep)
```
```out
# A tibble: 1,168 x 21
   country salary years_coded_job open_source hobby company_size_nu… career_satisfac… data_scientist
   <fct>    <dbl>           <dbl> <lgl>       <lgl>            <dbl>            <dbl> <lgl>         
 1 United… 100000              20 FALSE       TRUE              5000                8 FALSE         
 2 United… 130000              20 TRUE        TRUE              1000                9 FALSE         
 3 United… 120000              20 TRUE        TRUE               100                8 FALSE         
 4 United…  96283              20 TRUE        TRUE              1000               10 FALSE         
 5 United… 100297              15 FALSE       TRUE               100                8 FALSE         
 6 United… 146000              15 TRUE        TRUE             10000                8 FALSE         
 7 United… 160000              11 TRUE        TRUE               500                7 FALSE         
 8 United… 103000              15 TRUE        TRUE               500                8 FALSE         
 9 United… 115000               8 TRUE        FALSE               20                6 FALSE         
10 United…  97000               9 FALSE       TRUE               100                5 FALSE         
# … with 1,158 more rows, and 13 more variables: database_administrator <lgl>,
#   desktop_applications_developer <lgl>, developer_with_stats_math_background <lgl>,
#   dev_ops <lgl>, embedded_developer <lgl>, graphic_designer <lgl>, graphics_programming <lgl>,
#   machine_learning_specialist <lgl>, mobile_developer <lgl>, quality_assurance_engineer <lgl>,
#   systems_administrator <lgl>, web_developer <lgl>, remote <fct>
```

Notes: When you [`prep()`](https://tidymodels.github.io/recipes/reference/prep.html) a recipe, you estimate the required parameters from a data set for the preprocessing steps in that recipe (as an example, think about finding the mean and standard deviation if you are centering and scaling). 

When you [`juice()`](https://tidymodels.github.io/recipes/reference/juice.html) a prepped recipe, you get the preprocessed data back out. 

You don't typically need to `prep()` and `juice()` recipes when you use tidymodels, but they are heplful functions to have in your toolkit for confirming that recipes are doing what you expect.

---

# When do you balance classes? 🤔

- Training set?
- Testing set?

Notes: Does it make sense to try to change the class imbalance of the test set? 

---

# When do you balance classes? 🤔

- **Training set?**
- ~~Testing set?~~

Notes: **No, it does not!** 🙅 You want the set test to look like new data that your model will see in the future, so you don't want to mess with the class balance there; you want to see how your model will perform on imbalanced data, even if you have trained it on artificially balanced data.

---

# Let's practice!

Notes: All right, we've talked about some serious machine learning tools here and it's time to put them into practice.










