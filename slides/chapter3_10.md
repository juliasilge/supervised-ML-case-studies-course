---
type: slides
---

# Cross-validation

Julia Silge
Data Scientist at Stack Overflow

Notes: You have created a training set and testing set and laid out how to deal with class imbalance via upsampling. Now it's time to talk about a new resampling approach. In the first two case studies, we used bootstrap resampling and talked through what that means. In this chapter, we're going to use cross-validation.

---

# Cross-validation

Partitioning your data into subsets and using one subset for validation

Notes: Cross-validation means taking your training set and randomly dividing it up evenly into subsets, sometimes called "folds". A fold here means a group or subset or partition. You use one of the folds for validation and the rest for training, then you repeat these steps with all the subsets and combine the results, usually by taking the mean. The reason we do this is the same reason we would use bootstrap resampling; cross-validation allows you to reduce overfitting and get a more accurate estimate of how your model will perform on new data.

---

# Cross-validation

Partitioning your data into subsets and using one subset for validation

- `method = "cv"`
- `method = "repeatedcv"`


Notes: In caret, you implement this within the call to trainControl() with method = cv or method = repeatedcv. Let's look at this in more detail.

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation1.png?raw=true)


Notes: Let's say we have a sample of lots of people, some of whom voted and some of whom did not, and we want to implement 10-fold cross-validation. This means we divide our training data into 10 groups or folds, and 1 subset or fold acts as our validation fold. We train our model on 9 of the folds and then evaluate the model on the validation fold.

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation2.png?raw=true)

Notes: Now we move to the next fold and do this again. We train the model on the rest of the data, the other 9 folds, and evaluate the model on 1/10 of the data, the fold that is currently acting as our validation fold.

---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation3.png?raw=true)

Notes: We do it again using another of our folds as the validation fold, training the model on the rest of the data, and we move through all the subsets or folds of the data that we made...

---


![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/crossvalidation4.png?raw=true)

Notes: ... until we do them all, and have trained the model 10 times, on 10 different subsets of the data, with 10 different validation sets. We then combine all those models together to get one, better performing model. This procedure I just described is one round of 10-fold cross-validation. It's typical practice to do this more than once, perhaps 5 times. In that case, you repeat the whole process of 10-fold cross-validation 5 times, with 5 different random partitionings into 10 subsets. This is an approach to training models that has demonstrated good performance, 

---

# Cross-validation

- Repeated cross-validation can take a long time
- Parallel processing can be worth it

Notes: ... but it can be computationally expensive. It does lend itself to parallel processing, since the repeats don't depend on each other, so this is a situation where it likely is worth getting your computer set up to use all the cores you have.

---

# Let's practice!

Notes: Now it's your turn to implement cross-validation.









