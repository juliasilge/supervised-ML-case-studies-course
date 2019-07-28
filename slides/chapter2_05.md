---
type: slides
---

# Dealing with imbalanced data ⚖️


Notes: You just fit a simple logistic regression model to these survey results in order to predict which developers work remotely and which do not. Before we go any further, we need to talk about the class imbalance in our dataset.

---

# Class imbalance

Class imbalance

- is a common problem!
- often negatively affects the performance of your model 🙀

Notes: It's good that we're going to talk about class imbalance because it comes up a lot in real life. In many practical, real-world situations, there are a lot more of one kind of category in a dataset than another. In our example here, there are about ten times more non-remote developers than there are remote developers. What can happen in a situation like this is that a machine learning model will always predict the majority class or otherwise exhibit poor performance on the metrics that we care about.

---

# Class imbalance

```r
stackoverflow %>% 
    count(Remote)
```

```out
# A tibble: 2 x 2
  Remote         n
  <fctr>     <int>
1 Remote       718
2 Not remote  6273
```

Notes: This is in fact what happens with our dataset here (I know because I tested it out ✅) so we need to do something to address this imbalance. There are a variety of options available to you, which vary from quite simple to more complex, and we're going to start with a simple option.

---

# Upsampling or oversampling

- Add more of the minority class so it has more effect on the predictive model
- Randomly sample with replacement from the minority class until it is the same size as the majority class

Notes: In this case study, we're going to implement **upsampling**, also known as oversampling. With this approach, we randomly sample with replacement from the minority class until it's just as big as the majority class and it can have just as much effect on the machine learning model we're training.

---

![](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/upsample1.png?raw=true)

Notes: In our case study, there are roughly ten times more non-remote developers compared to the remote developers.


---

![](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/upsample2.png?raw=true)

Notes: When we implement upsampling, we add more of the remote developers (just more of the same ones we already have) until the proportion is equal, until the classes are balanced. This approach is simple to implement and understand, but it can lead a classifier to overfit to just a few examples, if you're not lucky. There are other more complex approaches to class imbalance available as well, but we will focus on upsampling here.

---

# Implementing upsampling

```r
up_train <- upSample(x = select(training, -Remote),
                     y = training$Remote,
                     yname = "Remote") %>%
    as_tibble()
```

Notes: You can implement upsampling using the `upSample()` function in caret or you can include it in a call where you specify a resampling approach like the bootstrap.

---

# Implementing upsampling


```r
stack_glm <- train(Remote ~ ., method = "glm", 
                   family = "binomial",
                   data = stack_train,
                   trControl = trainControl(method = "boot",
                                            sampling = "up"))
```

Notes: That second option is probably the best approach in most circumstances because you'll get a more realistic measure of model uncertainty when the resampling procedure also knows about the subsampling you're doing. Also, notice here that I'm working with the training dataset. 

---

# When do you balance classes? 🤔

- Training set?
- Testing set?

Notes: Does it make sense to try to change the class imbalance of the test set? 

---

# When do you balance classes? 🤔

- **Training set?**
- ~~Testing set?~~

Notes: **No, it does not!** You🙅  want the test set to look like new data that your model will see in the future, so you don't want to mess with the class balance there; you want to see how your model will perform on imbalanced data, even if you have trained it on artificially balanced data.

---

# Let's practice!

Notes: All right, we've talked about some serious machine learning tools here and it's time to put them into practice.










