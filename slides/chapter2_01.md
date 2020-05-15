---
type: slides
---

# Essential copying and pasting from Stack Overflow 💻


Notes: In the first chapter of this course, you practiced how to build regression models to predict fuel efficiency. Our second case study uses a dataset from the Stack Overflow Developer Survey.


---

![](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/so-logo.png?raw=true)

Notes: Stack Overflow is the world's largest, most trusted online community for developers (I bet you have used it!) and every year there is a large survey of developers, to learn about developers' opinions on different technologies, work habits, and so forth. 

---

# Stack Overflow Developer Survey

```out
# A tibble: 6,991 x 22
   respondent country salary years_coded_job open_source hobby company_size_nu… remote
        <dbl> <chr>    <dbl>           <dbl> <lgl>       <lgl>            <dbl> <fct> 
 1          3 United… 1.14e5              20 TRUE        TRUE             10000 Not r…
 2         15 United… 1.00e5              20 FALSE       TRUE              5000 Remote
 3         18 United… 1.30e5              20 TRUE        TRUE              1000 Remote
 4         19 United… 8.25e4               3 FALSE       TRUE             10000 Not r…
 5         26 United… 1.75e5              16 FALSE       TRUE             10000 Not r…
 6         55 Germany 6.45e4               4 FALSE       FALSE             1000 Not r…
 7         62 India   6.64e3               1 FALSE       TRUE              5000 Not r…
 8         71 United… 6.50e4               1 FALSE       TRUE                20 Not r…
 9         73 United… 1.20e5              20 TRUE        TRUE               100 Remote
10         77 United… 9.63e4              20 TRUE        TRUE              1000 Remote
# … with 6,981 more rows, and 14 more variables: career_satisfaction <dbl>, data_scientist <lgl>,
#   database_administrator <lgl>, desktop_applications_developer <lgl>,
#   developer_with_stats_math_background <lgl>, dev_ops <lgl>, embedded_developer <lgl>,
#   graphic_designer <lgl>, graphics_programming <lgl>, machine_learning_specialist <lgl>,
#   mobile_developer <lgl>, quality_assurance_engineer <lgl>, systems_administrator <lgl>,
#   web_developer <lgl>
```

Notes: In this case study, you are going to use data from the annual Developer Survey to build predictive models. First, you'll do exploratory data analysis to understand what's in the dataset, and how some of the quantities in the survey are distributed, and then you'll practice your machine learning skills by training classification models.

---

# Stack Overflow Developer Survey

Analyze the [data yourself](https://insights.stackoverflow.com/survey)!

Notes: Every year, the data for the Stack Overflow Developer Survey is made public, so this is all data that you can access and analyze yourself. I've already done some data cleaning and preparation, but we'll practice some of that in this chapter as well. There are a lot of predictive modeling possibilities in this dataset.

---

![](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/remote_size.png?raw=true)

Notes: The specific question we are going to address is what makes a developer more likely to work remotely. Developers can work in their company offices or they can work remotely, and it turns out that there are specific characteristics of developers, such as the size of the company that they work for, how much experience they have, or where in the world they live, that affect how likely they are to be a remote developer.

---

# Class imbalance ⚖️

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

Notes: That is what you are going to model! One of the things you'll notice right away about this dataset, however, is that the proportion of developers who are remote and those who work in an office is not balanced. This kind of class imbalance can have a significant negative impact on model performance, so we are going to have to cope with it. We will need to **preprocess** our data before we model it.

---

# Let's explore the data! 🌟

Notes: Let's start by exploring this new dataset, and then splitting our data into testing and training sets.
















