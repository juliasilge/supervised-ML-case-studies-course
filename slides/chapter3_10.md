---
type: slides
---

# Cross-validation


Notes: You have created a training set and testing set and laid out how to deal with class imbalance via upsampling. Now it's time to talk about a new resampling approach. In the first case study, we used bootstrap resampling and talked through what that means. In this chapter, we're going to use **cross-validation**.

---

# Cross-validation

Partitioning your data into subsets and using one subset for validation

Notes: Cross-validation means taking your training set and randomly dividing it up evenly into subsets, sometimes called "folds". A fold here means a group or subset or partition. 

You use one of the folds for validation and the rest for training, then you repeat these steps with all the subsets and combine the results, usually by taking the mean. The reason we do this is the same reason we would use bootstrap resampling; cross-validation allows you to get a more accurate estimate of how your model will perform on new data.

---

# Cross-validation

Partitioning your data into subsets and using one subset for validation

- `vfold_cv(vote_train, v = 10)`
- `vfold_cv(vote_train, v = 10, repeats = 5)`


Notes: In tidymodels, you can create cross-validation resamples with the function `vfold_cv()`, either with or without the `repeats` argument. 

Let's look at this in more detail. 🧐

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation1.png?raw=true)


Notes: Let's say we have a sample of lots of people, some of whom voted and some of whom did not, and we want to implement 10-fold cross-validation. This means we divide our training data into 10 groups or folds, and 1 subset or fold acts as our assessment fold (like a mini testing test). We train our model on 9 of the folds and then evaluate the model on the assessment fold.

If we are using preprocessing steps such as upsampling that should **only** be applied to the 9/10 of the data used for analysis (not the 1/10 of the data used for assessment), the [recipes](https://tidymodels.github.io/recipes/) package will automatically take care of that for us. 👍

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation2.png?raw=true)

Notes: Now we move to the next fold and do this again. We train the model on the rest of the data, the other 9 folds, and evaluate the model on 1/10 of the data, the fold that is currently acting as our assessment fold.

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation3.png?raw=true)

Notes: We do it again using another of our folds as the assessment fold, training the model on the rest of the data, and we move through all the subsets or folds of the data that we made...

---


![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation4.png?raw=true)

Notes: ... until we do them all, and have trained the model 10 times, on 10 different subsets of the data, with 10 different assessment sets. We then combine all those results together to get one, better estimate of how our model will perform. 

This procedure I just described is **one round of 10-fold cross-validation**. Sometimes practictioners do this more than once, perhaps 5 times. In that case, you repeat the whole process of 10-fold cross-validation 5 times, with 5 different random partitionings into 10 subsets. This is an approach to training models that has demonstrated good performance.

---

# Cross-validation

- Repeated cross-validation can take a long time
- Parallel processing can be worth it

Notes: However, it can be computationally expensive. ⏳ It does lend itself to parallel processing, since the repeats don't depend on each other, so this is a situation where it likely is worth getting your computer set up to use all the cores you have.

---

# Let's practice! 🎯 

Notes: Now it's your turn to implement cross-validation.









