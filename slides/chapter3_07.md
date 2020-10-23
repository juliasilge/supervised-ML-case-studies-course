---
type: slides
---

# VOTE 2016 🇺🇸

Julia Silge
Data Scientist at Stack Overflow

Notes: To do a good job with predictive modeling, you need to explore and understand your data before you start building machine learning models. When you do exploratory data analysis, you learn important things, such as how imbalanced the class you are trying to predict is...

---

# Exploratory data analysis


| | Elections don't matter | Gay rights are very important | Crime is very important |
| --- | --- | --- | --- |
| Did not vote   | 55.3%                  | 17.0%                     | 66.3%  |                
| Voted          | 34.1%                  | 25.3%                     | 57.6%  |                

Notes: ...and how much of a difference you see in survey responses between the two groups. We see here that people who say that elections don't matter and things stay the same no matter who we vote in were less likely to vote, while people who think that gay rights are important were more likely to vote. We can see differences like this for many of the survey questions.

---

# Exploratory data analysis

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/econtrend.png?raw=true)

Notes: Visualizing your data before modeling is always a good idea. 👍 

Here, for example, we can see that people who say the economy is getting better are more likely to vote.

---

![](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/downsample1.png?raw=true)

Notes: This is another case study with imbalanced data. We are again going to preprocess our training data so we can build a better performing model, but this time we are going to **upsample** (or oversample) our data.


---

![](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/upsample2.png?raw=true)

Notes: When we implement upsampling, we add more of the people who did not vote (just more of the same ones we already have) until the proportion is equal and the classes are balanced. 

We are going to use [`step_upsample()`](https://themis.tidymodels.org/reference/step_upsample.html) for oversampling because it is simple to implement and understand, but it can lead a classifier to overfit to just a few examples, if you're not lucky. There are other more complex approaches to oversampling available in the [themis](https://tidymodels.github.io/themis/) package as well, but we will focus on random upsampling with replacement here.

---

# Preprocess your data

```r
library(themis)

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016)
```

Notes: Upsampling is another example of a preprocessing step for modeling. You can again preprocess your data using [recipes](https://tidymodels.github.io/recipes/). The recipe shown in this slide again has just one preprocessing step (upsampling) but you can create recipes for preprocessing with as many steps as you need.

---

# Build a `workflow()`

```r
vote_wf <- workflow() %>%
    add_recipe(vote_recipe) %>%
    add_model(rf_spec)

vote_wf
```

```out
══ Workflow ══════════════════════════════════════════════════════════════════
Preprocessor: Recipe
Model: rand_forest()

── Preprocessor ──────────────────────────────────────────────────────────────
1 Recipe Step

● step_upsample()

── Model ─────────────────────────────────────────────────────────────────────
Random Forest Model Specification (classification)

Computational engine: ranger 
```

Notes: To put our recipe and our model specification together, let's use a [`workflow()`](https://tidymodels.github.io/workflows/). We can fit our workflow much like we would fit a model.

---

# Let's build some models!✨

Notes: Now that you have explored your data and have some understanding of it, it's time to move into machine learning.

