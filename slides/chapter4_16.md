---
type: slides
---

# You made it! 💪

Notes: Congratulations! You finished our fourth and final case study in this course on case studies in supervised machine learning.

---

# Predicting age


```out
── Model ──────────────────────────────────────────────────────────────────────
n= 14460 

node), split, n, deviance, yval
      * denotes terminal node

 1) root 14460 3691121.000 48.11134  
   2) PC1< 1.744274 10223 1988405.000 43.87362  
     4) PC1< -0.3827951 7068 1163392.000 41.99774  
       8) PC3< 1.289199 5743  864820.600 41.02037  
        16) PC2>=-6.154196 5715  840659.100 40.90114 *
        17) PC2< -6.154196 28    7496.429 65.35714 *
       9) PC3>=1.289199 1325  269307.500 46.23396  
        18) PC3< 2.638801 1079  211851.500 45.33828 *
        19) PC3>=2.638801 246   52793.500 50.16260 *
     5) PC1>=-0.3827951 3155  744421.700 48.07607  
      10) PC3< 0.2146542 1643  342640.400 45.51430  
        20) PC4>=-3.03208 1629  332107.700 45.36525 *
        21) PC4< -3.03208 14    6285.714 62.85714 *
      11) PC3>=0.2146542 1512  379282.300 50.85979  
        22) PC1< 0.5623101 693  160369.100 48.51371 *
        23) PC1>=0.5623101 819  211871.300 52.84493 *
   3) PC1>=1.744274 4237 1076169.000 58.33609  
     6) PC1< 4.98542 3009  761850.300 55.43702  
      12) PC3< 0.09750898 1621  396508.800 53.01049  
        24) PC1< 3.348799 902  210185.400 50.48780 *
        25) PC1>=3.348799 719  173381.900 56.17524 *
      13) PC3>=0.09750898 1388  344650.100 58.27089  
        26) PC4>=-1.117264 1088  272870.200 57.04044 *
        27) PC4< -1.117264 300   64158.670 62.73333 *
     7) PC1>=4.98542 1228  227062.500 65.43974  
      14) PC4>=-1.213035 750  143755.900 63.21333  
        28) PC3< -1.338169 120   26320.000 58.00000 *
        29) PC3>=-1.338169 630  113553.200 64.20635 *
      15) PC4< -1.213035 478   73755.860 68.93305  
        30) PC1< 7.248641 297   52855.220 67.44108 *
        31) PC1>=7.248641 181   19154.700 71.38122 *
```

Notes: You tuned model hyperparameters for a decision tree (cost complexity and tree depth) along with the number of components to use in PCA for data preprocessing. The resulting decision tree (shown here) exhibits some sensible behavior, with the first principal component being the variable for the first split, etc.

---

# Predicting age

```r
final_tree <- final_wf %>%
  last_fit(sisters_split) 

final_tree %>%
  collect_metrics()
```

```out
# A tibble: 2 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 rmse    standard      14.0  
2 rsq     standard       0.236
```

Notes: The performance metrics you achieved on the testing set indicate that you did not overfit during the tuning process.

---

# Predicting age

- **Build** your model with your training data
- **Choose** your model and model hyperparameters with your validation data
- **Evaluate** your model with your testing data

Notes: You divided your data into three subsets: a training set to train your model, a validation set to tune hyperparameters, and then a testing set to evaluate the performance of your model and estimate how it will do with new data.

You can also use a validation set to choose between different models.

---

# Diverse data, powerful tools

- Fuel efficiency of cars 🚗
- Developers working remotely in the Stack Overflow survey 💻
- Voter turnout in 2016 🗳
- Catholic nuns' ages based on beliefs and attitudes ⛪

Notes: This analysis was just the final example in the series of predictive projects you approached in this course. 

You learned how to go from raw data to exploring that data to training models to evaluating those models using the [tidymodels](https://www.tidymodels.org/) metapackage and important tools for exploratory data analysis from the [tidyverse](https://www.tidyverse.org/) ecosystem, like dplyr and ggplot2.

---

#  Practical machine learning

- Dealing with class imbalance
- Measuring performance with resampling (bootstrap, cross-validation)
- Tuning hyperparameters

Notes: In this course, I've chosen to spend our energy and time on some of the issues that I have found to be the most important and most impactful from my real world, practical predictive modeling experience. These include knowing what to do when you are faced with class imbalance, having some options in your toolkit for resampling approaches, and optimizing model hyperparametrs. 

---

#  Practical machine learning

![tidymodels](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/tidymodels_small.png?raw=true)

Notes: To keep going in your machine learning journey, check out the resources at [`tidymodels.org`](https://www.tidymodels.org/). This site is a central location for resources and documentation for tidymodels packages, and there is a ton to explore and learn. 🚀

There are five articles at [**Get Started**](https://www.tidymodels.org/start/) that guide you through what you need to know to use tidymodels, and many more resources at [**Learn**](https://www.tidymodels.org/learn/).

---

# Practical machine learning

- Try out multiple modeling approaches for each new problem 
- Overall, [gradient tree boosting and random forest](https://arxiv.org/abs/1708.05070v1) 🌳 perform well

Notes: The high level takeaways that you should remember from this course are first, that each time you have a new predictive modeling problem you are working on, you need to try out multiple different kinds of models. You don't know ahead of time which kind of model is going to perform best. This paper linked on this slide uses some super interesting analysis to show that most often, the two kinds of models that perform best are gradient tree boosting and random forest. 

However, depending on how much data you have and the specifics of your problem, that may not be true, so you have to try it for yourself. Also, start with a **simple model** to compare to. 

---

# Never skip exploratory data analysis ✅



Notes: And perhaps most importantly, never skip exploratory data analysis when you build machine learning models. It is time well spent, because when you understand a data set better, you can do a better job of building accurate models that perform better.

---

# Go train some models!

Notes: And that's our ultimate goal here! Thanks for spending time with me on this course. Now it's time for you to take what you've been practicing here and go apply it in the real world.

If this course has been helpful to you, you can [buy me a coffee](https://ko-fi.com/U7U4WG9B) or chip in for hosting costs.

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/U7U4WG9B)












