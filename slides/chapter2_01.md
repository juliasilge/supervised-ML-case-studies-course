---
type: slides
---

# Essential copying and pasting from Stack Overflow

## Julia Silge
## Data Scientist at Stack Overflow

Notes: In the first chapter of this course, you practiced how to build regression models to predict fuel efficiency. Our second case study uses a dataset from the Stack Overflow Developer Survey.


---

![](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/so-logo.png?raw=true)

Notes: Stack Overflow is the world's largest, most trusted online community for developers (I bet you have used it!) and every year there is a large survey of developers, to learn about developers' opinions on different technologies, work habits, and so forth. 

---

# Stack Overflow Developer Survey

```out
> stackoverflow

# A tibble: 6,991 x 22
   Respondent Country    Salary YearsCodedJob OpenSource Hobby CompanySizeNumb…
        <int> <chr>       <dbl>         <dbl> <lgl>      <lgl>            <dbl>
 1          3 United Ki… 113750         20.0  T          T              10000  
 2         15 United Ki… 100000         20.0  F          T               5000  
 3         18 United St… 130000         20.0  T          T               1000  
 4         19 United St…  82500          3.00 F          T              10000  
 5         26 United St… 175000         16.0  F          T              10000  
 6         55 Germany     64516          4.00 F          F               1000  
 7         62 India        6636          1.00 F          T               5000  
 8         71 United St…  65000          1.00 F          T                 20.0
 9         73 United St… 120000         20.0  T          T                100  
10         77 United St…  96283         20.0  T          T               1000  
# ... with 6,981 more rows, and 15 more variables: Remote <fct>,
#   CareerSatisfaction <int>, `Data scientist` <lgl>, `Database
#   administrator` <lgl>, `Desktop applications developer` <lgl>, `Developer
#   with stats/math background` <lgl>, DevOps <lgl>, `Embedded
#   developer` <lgl>, `Graphic designer` <lgl>, `Graphics programming` <lgl>,
#   `Machine learning specialist` <lgl>, `Mobile developer` <lgl>, `Quality
#   assurance engineer` <lgl>, `Systems administrator` <lgl>, `Web
#   developer` <lgl>
```

Notes: In this case study, you are going to use data from the Developer Survey to build predictive models. First, you'll do exploratory data analysis to understand what's in the dataset, and how some of the quantities in the survey are distributed, and then you'll practice your machine learning skills by training classification models.

---

# Stack Overflow Developer Survey

Analyze the [data yourself](https://insights.stackoverflow.com/survey)!

Notes: Every year, the data for the Stack Overflow Developer Survey is made public, so this is all data that you can access and analyze yourself. I've already done some data cleaning and preparation, but we'll practice some of that in this chapter as well. There are a lot of predictive modeling possibilities in this dataset.

---

![](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/remote_size.png?raw=true)

Notes: The specific question we are going to address is what makes a developer more likely to work remotely. Developers can work in their company offices or they can work remotely, and it turns out that there are specific characteristics of developers, such as the size of the company that they work for, how much experience they have, or where in the world they live, that affect how likely they are to be a remote developer.

---

# Class imbalance

```out
> stackoverflow %>% 
+         count(Remote)

# A tibble: 2 x 2
  Remote         n
  <fctr>     <int>
1 Remote       718
2 Not remote  6273
```

Notes: That is what you are going to model! One of the things you'll notice right away about this dataset, however, is that the proportion of developers who are remote and those who work in an office is not balanced. This kind of class imbalance can have a significant negative impact on model performance, so we are going to have to cope with it.

---

# Building a simple model

```out
> simple_glm <- stackoverflow %>%
+     select(-Respondent) %>%
+     glm(Remote ~ .,
+         family = "binomial",
+         data = .)
> 
> summary(simple_glm)
```

- `Remote ~ .` 
- `data = .` 

Notes: It's a good idea to start any predictive modeling project by building the simplest possible model. In this case, that's a logistic regression model, trained on all the data without any special tricks. Let's talk about the syntax shown here on this slide because there are two instances of the dot. 

The first dot you see is in the formula that specifies the model that is being trained. It says `Remote ~ .`, which means let's predict remote status with all the other variables in the dataset. 

The second dot there says `data = .`, and we are using *this* because we are piping in our dataset using the pipe operator from dplyr and magrittr. That dot is telling the modeling function where the data is coming from, i.e., that it is the first argument we're sending it. So there are two dots and they mean different things! Try to keep that in mind as we move forward doing exploratory data analysis.

---

# Let's explore the data!

Notes: Let's start by thinking through our modeling approach and exploring this new dataset.

---















