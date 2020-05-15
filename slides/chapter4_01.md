---
type: slides
---

# Surveying Catholic sisters in 1967

Notes: You have made it to the last case study of our course! 🎉 It is a particularly compelling one, where we are going to practice some advanced skills in modeling.

---

# Conference of Major Superiors of Women Sisters' Survey 

- Fielded in 1967 with over 600 questions
- Responses from over 130,000 sisters in almost 400 congregations
- Data is [freely available](https://curate.nd.edu/show/0r967368551)

Notes: In 1967, a Catholic nun named Sister Marie Augusta Neal who had a PhD in sociology from Harvard fielded a survey of all members of Catholic women's religious communities, i.e., nuns. It was a survey with over 600 questions that went out to over 130,000 individual sisters and was fielded in a time of significant change both for the Catholic church and society in general.

This survey is so big with so much data that we're actually only giving you a subset, about one quarter of it, in your environment here during the case study. The whole survey is available online and it is pretty interesting, so I encourage you to take a look for yourself.

---

# Opinions and attitudes in the 1960s

Response | Code 
--- | --- 
Disagree very much | 1
Disagree somewhat | 2 
Neither agree nor disagree | 3 
Agree somewhat | 4 
Agree very much | 5

Check out the survey's [codebook](https://curate.nd.edu/downloads/0v838051f6x).

Notes: There is demographic information in the survey, along with a lot of diverse kinds of questions. About 60 of the survey questions were agreement questions, with a *statement* (of some kind) that the survey asked the respondent to agree or disagree with on this scale. The answers are coded as integers from 1 to 5.

---

# Opinions and attitudes in the 1960s

```r
> sisters67
```
```out
# A tibble: 77,112 x 67
     age sister  v116  v117  v118  v119  v120  v121  v122  v123  v124  v125  v126  v127
   <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
 1    60      1     1     1     3     5     1     1     3     5     3     1     1     3
 2    70      2     2     2     4     4     1     3     1     5     4     1     4     4
 3    60      3     1     1     3     2     2     3     1     1     3     1     1     1
 4    60      4     5     1     2     4     1     3     4     3     3     4     1     1
 5    50      5     2     3     3     3     2     2     1     5     2     5     5     5
 6    40      7     4     3     2     5     4     3     1     5     2     5     4     4
 7    50      9     5     4     5     4     4     5     3     5     4     2     1     5
 8    40     10     5     4     3     5     1     3     5     5     5     4     1     5
 9    30     11     2     2     3     5     1     3     3     5     1     3     1     2
10    30     12     4     1     5     5     1     4     3     5     1     5     1     1
# … with 77,102 more rows, and 53 more variables: v128 <dbl>, v129 <dbl>, v130 <dbl>,
#   v131 <dbl>, v132 <dbl>, v133 <dbl>, v134 <dbl>, v135 <dbl>, v136 <dbl>, v137 <dbl>,
#   v138 <dbl>, v139 <dbl>, v140 <dbl>, v141 <dbl>, v142 <dbl>, v143 <dbl>, v144 <dbl>,
#   v145 <dbl>, v146 <dbl>, v147 <dbl>, v148 <dbl>, v149 <dbl>, v150 <dbl>, v151 <dbl>,
#   v152 <dbl>, v153 <dbl>, v154 <dbl>, v155 <dbl>, v156 <dbl>, v157 <dbl>, v158 <dbl>,
#   v159 <dbl>, v160 <dbl>, v161 <dbl>, v162 <dbl>, v163 <dbl>, v164 <dbl>, v165 <dbl>,
#   v166 <dbl>, v167 <dbl>, v168 <dbl>, v169 <dbl>, v170 <dbl>, v171 <dbl>, v172 <dbl>,
#   v173 <dbl>, v174 <dbl>, v175 <dbl>, v176 <dbl>, v177 <dbl>, v178 <dbl>, v179 <dbl>,
#   v180 <dbl>
```

Notes: The integer 1 corresponds to "disagree very much" and 5 corresponds to "agree very much". This kind of coding is convenient for our modeling purposes here. The data that you will have available within this case study is only this subset of the survey: the agree/disagree statements, plus age.


---

![Alt text](https://github.com/juliasilge/course-ML-tidymodels/blob/master/img/age_histogram.png?raw=true)

Notes: The original survey question asked for age in bins of 10 years, under 20, from 21 to 30, from 31 to 40, and so forth. I have recoded these as numeric values corresponding to the top of each age bin, 20, 30, 40, and so on. This means that this isn't quite a continuous variable, since we haven't measured these women's ages very precisely, but we can do a pretty good job modeling it as if it is. There are more sophisticated modeling approaches possible with these kinds of measurements that you could explore.  

---

# Opinions and attitudes in the 1960s


- "Catholics should boycott indecent movies."
- "In the past 25 years, this country has moved dangerously close to socialism."
- "I would rather be called an idealist than a practical person."

Notes: These agreement questions on the survey are mostly social and religious in nature, focusing on what the respondent believes about society, the place of religion within the world, and her own role. 

I do want to point out that this survey was fielded during the 1960s and there are some words used, for example for people of color, that are not used in professional or academic environments today. This is a historical dataset that we can approach and understand as centered in its context.

---

# Tidy your data

```r
sisters67 %>%
    select(-sister) %>%
    pivot_longer(-age, names_to = "question", values_to = "rating")
```

```out
# A tibble: 5,012,280 x 3
     age question rating
   <dbl> <chr>     <dbl>
 1    60 v116          1
 2    60 v117          1
 3    60 v118          3
 4    60 v119          5
 5    60 v120          1
 6    60 v121          1
 7    60 v122          3
 8    60 v123          5
 9    60 v124          3
10    60 v125          1
# … with 5,012,270 more rows
```

Notes: In this case study, we are going to spend a bit more effort on exploratory data analysis. You are going to create a tidy version of the survey data with one row per observation. 

In the original way the data is structured, there is one row per respondent with a separate column for each answer. After you tidy the data, using the function [`pivot_longer()`](https://tidyr.tidyverse.org/reference/pivot_longer.html), you will have one row for each combination of respondent and question, a much longer and skinnier dataset. This kind of tidy data structure is well suited to exploratory data analysis.

---

# Let's practice!🌟

Notes: Let's go learn something about Catholic nuns in the 1960s. 











