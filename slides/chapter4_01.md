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

Notes: There is demographic information in the survey, along with a lot of diverse kinds of questions. About 60 of the survey questions were agreement questions, with a *statment* (of some kind) that the survey asked the respondent to agree or disagree with on this scale. The answers are coded as integers from 1 to 5.

---

# Opinions and attitudes in the 1960s

```
> sisters67

# A tibble: 77,112 x 67
     age sister  v116  v117  v118  v119  v120  v121  v122  v123  v124  v125
   <dbl>  <int> <int> <int> <int> <int> <int> <int> <int> <int> <int> <int>
 1  60.0      1     1     1     3     5     1     1     3     5     3     1
 2  70.0      2     2     2     4     4     1     3     1     5     4     1
 3  60.0      3     1     1     3     2     2     3     1     1     3     1
 4  60.0      4     5     1     2     4     1     3     4     3     3     4
 5  50.0      5     2     3     3     3     2     2     1     5     2     5
 6  40.0      7     4     3     2     5     4     3     1     5     2     5
 7  50.0      9     5     4     5     4     4     5     3     5     4     2
 8  40.0     10     5     4     3     5     1     3     5     5     5     4
 9  30.0     11     2     2     3     5     1     3     3     5     1     3
10  30.0     12     4     1     5     5     1     4     3     5     1     5
# ... with 77,102 more rows, and 55 more variables: v126 <int>, v127 <int>,
#   v128 <int>, v129 <int>, v130 <int>, v131 <int>, v132 <int>, v133 <int>,
#   v134 <int>, v135 <int>, v136 <int>, v137 <int>, v138 <int>, v139 <int>,
#   v140 <int>, v141 <int>, v142 <int>, v143 <int>, v144 <int>, v145 <int>,
#   v146 <int>, v147 <int>, v148 <int>, v149 <int>, v150 <int>, v151 <int>,
#   v152 <int>, v153 <int>, v154 <int>, v155 <int>, v156 <int>, v157 <int>,
#   v158 <int>, v159 <int>, v160 <int>, v161 <int>, v162 <int>, v163 <int>,
#   v164 <int>, v165 <int>, v166 <int>, v167 <int>, v168 <int>, v169 <int>,
#   v170 <int>, v171 <int>, v172 <int>, v173 <int>, v174 <int>, v175 <int>,
#   v176 <int>, v177 <int>, v178 <int>, v179 <int>, v180 <int>
```

Notes: The integer 1 corresponds to "disagree very much" and 5 corresponds to "agree very much". This kind of coding is convenient for our modeling purposes here. The data that you will have available within this case study is only this subset of the survey: the agree/disagree statements, plus age.


---

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/age_histogram.png?raw=true)

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
    gather(key, value, -age)
```

```out
# A tibble: 5,012,280 x 3
     age key   value
   <dbl> <chr> <int>
 1  60.0 v116      1
 2  70.0 v116      2
 3  60.0 v116      1
 4  60.0 v116      5
 5  50.0 v116      2
 6  40.0 v116      4
 7  50.0 v116      5
 8  40.0 v116      5
 9  30.0 v116      2
10  30.0 v116      4
# ... with 5,012,270 more rows
```

Notes: In this case study, we are going to spend a bit more effort on exploratory data analysis. You are going to create a tidy version of the survey data with one row per observation. In the original way the data is structured, there is one row per respondent with a separate column for each answer. After you tidy the data, using the function [`gather()`](https://tidyr.tidyverse.org/reference/gather.html), you will have one row for each combination of respondent and question, a much longer and skinnier dataset. This kind of tidy data structure is well suited to exploratory data analysis.

---

# Let's practice!🌟

Notes: Let's go learn something about Catholic nuns in the 1960s. 











