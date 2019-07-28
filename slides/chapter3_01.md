---
type: slides
---

# Predicting voter turnout from survey data 🗳

Notes: So far, you have built one regression model and one classification model, and now it's time for our third case study. In this case study, we are going to use a survey of voters in the United States to predict voter turnout, whether someone did or did not vote, based on their responses on the survey.

---

# Views of the Electorate Research Survey (VOTER) 🇺🇸

- Democracy Fund Voter Study Group
- Politically diverse group of analysts and scholars in the United States
- Data is [freely available](https://www.voterstudygroup.org/publications/2016-elections/data)

Notes: This data comes from a research collaboration of about two dozen analysts and scholars across the political spectrum in the United States who want to understand what is important to voters and how the views of the electorate in the U.S. are evolving.

---

# Views of the Electorate Research Survey (VOTER) 🇺🇸

- Life in America today for people like you compared to fifty years ago is better? about the same? worse?
- Was your vote primarily a vote in favor of your choice or was it mostly a vote against his/her opponent?
- How important are the following issues to you?
  - Crime
  - Immigration
  - The environment
  - Gay rights

Notes: There are a lot of questions on this survey, so many that I can't go over them all with you in this course, but they are all about people's opinions on political and economic topics. The survey asks respondents how they feel about where the US economy is headed, whether they think their vote makes a difference, and how important various issues are to them.

---

# Views of the Electorate Research Survey (VOTER) 🇺🇸


```out
> voters

# A tibble: 6,692 x 43
   case_identifier turnout16_2016 RIGGED_SYSTEM_1_2016 RIGGED_SYSTEM_2_2016
             <int> <fct>                         <int>                <int>
 1             779 Voted                             3                    4
 2            2108 Voted                             2                    1
 3            2597 Voted                             2                    4
 4            4148 Voted                             1                    4
 5            4460 Voted                             3                    1
 6            5225 Voted                             3                    3
 7            5903 Voted                             3                    4
 8            6059 Voted                             2                    3
 9            8048 Voted                             4                    4
10           13112 Voted                             2                    3
# ... with 6,682 more rows, and 39 more variables: RIGGED_SYSTEM_3_2016 <int>,
#   RIGGED_SYSTEM_4_2016 <int>, RIGGED_SYSTEM_5_2016 <int>,
#   RIGGED_SYSTEM_6_2016 <int>, track_2016 <int>, persfinretro_2016 <int>,
#   econtrend_2016 <int>, Americatrend_2016 <int>, futuretrend_2016 <int>,
#   wealth_2016 <int>, values_culture_2016 <int>, US_respect_2016 <int>,
#   trustgovt_2016 <int>, trust_people_2016 <int>, helpful_people_2016 <int>,
#   fair_people_2016 <int>, imiss_a_2016 <int>, imiss_b_2016 <int>,
#   imiss_c_2016 <int>, imiss_d_2016 <int>, imiss_e_2016 <int>,
#   imiss_f_2016 <int>, imiss_g_2016 <int>, imiss_h_2016 <int>,
#   imiss_i_2016 <int>, imiss_j_2016 <int>, imiss_k_2016 <int>,
#   imiss_l_2016 <int>, imiss_m_2016 <int>, imiss_n_2016 <int>,
#   imiss_o_2016 <int>, imiss_p_2016 <int>, imiss_q_2016 <int>,
#   imiss_r_2016 <int>, imiss_s_2016 <int>, imiss_t_2016 <int>,
#   imiss_u_2016 <int>, imiss_x_2016 <int>, imiss_y_2016 <int>
```


Notes: The dataset that you have to work with in these exercises has about 40 variables, or questions on the survey, and the variable `turnout16_2016` tells us whether that respondent said they voted in the 2016 election or not. Notice that the answers to the survey questions have been coded as integers. This is actually pretty convenient for modeling, but in a situation like this, you need to look at a data dictionary or guide to understand what the integers mean.

---

# Interpreting integer survey responses

#### AMERICA IS A FAIR SOCIETY WHERE EVERYONE HAS THE OPPORTUNITY TO GET AHEAD

Response | Code 
--- | --- 
Strongly agree | 1
Agree | 2 
Disagree | 3 
Strongly disagree | 4 

Learn [more about the data yourself](https://www.voterstudygroup.org/publications/2016-elections/data)!

Notes: For example, one of the questions asked survey respondents how much they agree or disagree with this statement about how fair society in America is and their responses are coded as these integers. All of the survey responses are coded as integers like this, which means we can use these responses directly for modeling. I'll include the answers that correspond to the integers when it's relevant in this case study, but you can go get this data yourself as well.

---

# Predicting voter turnout


```r
voters %>%
    count(turnout16_2016)
```

```out
# A tibble: 2 x 2
  turnout16_2016     n
  <fct>          <int>
1 Did not vote     264
2 Voted           6428
```

Notes: We are going to build machine learning models to predict whether a respondent voted or not based on their responses to the survey questions. You are going to be able to use many of the approaches you've been practicing already in the course, and develop some new ones.

---

# Let's get started! 🙌

Notes: It's time for you to get started with this new dataset and see what you can learn.

---










