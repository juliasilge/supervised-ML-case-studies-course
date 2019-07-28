---
type: slides
---

# VOTE 2016 🇺🇸

Julia Silge
Data Scientist at Stack Overflow

Notes: To do a good job with predictive modeling, you need to explore and understand your data before you start building machine learning models. When you do exploratory data analysis, you learn important things, such as how imbalanced the class you are trying to predict is...

---

# Exploratory data analysis

Elections don't matter |Gay rights are very important |Crime is very important
---	| ---	| ---	| ---
Did not vote   |55.3%                  |17.0%                     |66.3%                  
Voted          |34.1%                  |25.3%                     |57.6%                  


Notes: ...and how much of a difference you see in survey responses between the two groups. We see here that people who say that elections don't matter and things stay the same no matter who we vote in were less likely to vote, while people who think that gay rights are important were more likely to vote. We can see differences like this for many of the survey questions.

---

# Exploratory data analysis

![Alt text](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/econtrend.png?raw=true)

Notes: Visualizing your data before modeling is always a good idea. 👍 Here, for example, we can see that people who say the economy is getting better are more likely to vote.

---

# Fitting a simple model

```r
simple_glm <- glm(turnout16_2016 ~ .,  family = "binomial", 
                  data = select(voters, -case_identifier))
 
summary(simple_glm)
```

```out
Call:
glm(formula = turnout16_2016 ~ ., family = "binomial", 
    data = select(voters, -case_identifier))

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-3.2373   0.1651   0.2214   0.3004   1.7708  

Coefficients:
                      Estimate Std. Error z value Pr(>|z|)    
(Intercept)           2.457036   0.732721   3.353 0.000799 ***
RIGGED_SYSTEM_1_2016  0.236284   0.085081   2.777 0.005484 ** 
RIGGED_SYSTEM_2_2016  0.064749   0.089208   0.726 0.467946    
RIGGED_SYSTEM_3_2016  0.049357   0.107352   0.460 0.645680    
RIGGED_SYSTEM_4_2016 -0.074694   0.087583  -0.853 0.393749    
RIGGED_SYSTEM_5_2016  0.190252   0.096454   1.972 0.048556 *  
RIGGED_SYSTEM_6_2016 -0.005881   0.101381  -0.058 0.953740    
track_2016            0.241075   0.121467   1.985 0.047178 *  
persfinretro_2016    -0.040229   0.106714  -0.377 0.706191    
econtrend_2016       -0.295370   0.087224  -3.386 0.000708 ***
Americatrend_2016    -0.105213   0.080845  -1.301 0.193116    
futuretrend_2016      0.210568   0.071201   2.957 0.003103 ** 
wealth_2016          -0.069405   0.026344  -2.635 0.008424 ** 
values_culture_2016  -0.041402   0.038670  -1.071 0.284332    
US_respect_2016      -0.068200   0.043785  -1.558 0.119322    
trustgovt_2016        0.315354   0.166655   1.892 0.058456 .  
trust_people_2016     0.040423   0.041518   0.974 0.330236    
helpful_people_2016  -0.037513   0.035353  -1.061 0.288643    
fair_people_2016     -0.017081   0.030170  -0.566 0.571294    
imiss_a_2016          0.397121   0.138987   2.857 0.004273 ** 
imiss_b_2016         -0.250803   0.155454  -1.613 0.106667    
imiss_c_2016          0.017536   0.090647   0.193 0.846606    
imiss_d_2016          0.043510   0.122118   0.356 0.721619    
imiss_e_2016         -0.095552   0.078603  -1.216 0.224126    
imiss_f_2016         -0.323280   0.105432  -3.066 0.002168 ** 
imiss_g_2016         -0.332034   0.078673  -4.220 2.44e-05 ***
imiss_h_2016         -0.157298   0.107111  -1.469 0.141954    
imiss_i_2016          0.088695   0.091467   0.970 0.332196    
imiss_j_2016          0.060271   0.138429   0.435 0.663280    
imiss_k_2016         -0.181030   0.082726  -2.188 0.028646 *  
imiss_l_2016          0.274689   0.106781   2.572 0.010098 *  
imiss_m_2016         -0.124269   0.147888  -0.840 0.400746    
imiss_n_2016         -0.441612   0.090040  -4.905 9.36e-07 ***
imiss_o_2016          0.198635   0.143160   1.388 0.165286    
imiss_p_2016          0.102987   0.105669   0.975 0.329751    
imiss_q_2016          0.244567   0.119093   2.054 0.040017 *  
imiss_r_2016          0.198839   0.121969   1.630 0.103050    
imiss_s_2016         -0.067310   0.134465  -0.501 0.616666    
imiss_t_2016         -0.116757   0.068143  -1.713 0.086639 .  
imiss_u_2016          0.022902   0.097312   0.235 0.813939    
imiss_x_2016         -0.017789   0.097349  -0.183 0.855003    
imiss_y_2016          0.150205   0.094536   1.589 0.112092    

```

Notes: Another good step before you start training more complex models is to start with just the absolute, simplest model possible, to get your bearings and have a baseline for comparison. You also can use a model like this to understand which predictors are driving, in our case here, the likelihood of people to vote.

---

# Fitting a simple model

```r
library(broom)
 
tidy(simple_glm) %>%
    filter(p.value < 0.05) %>%
    arrange(desc(estimate))
```

```out
                   term    estimate  std.error statistic      p.value
1           (Intercept)  2.45703562 0.73272138  3.353301 7.985370e-04
2          imiss_a_2016  0.39712084 0.13898678  2.857256 4.273207e-03
3          imiss_l_2016  0.27468893 0.10678119  2.572447 1.009825e-02
4          imiss_q_2016  0.24456695 0.11909335  2.053573 4.001699e-02
5            track_2016  0.24107452 0.12146679  1.984695 4.717843e-02
6  RIGGED_SYSTEM_1_2016  0.23628350 0.08508091  2.777162 5.483579e-03
7      futuretrend_2016  0.21056782 0.07120079  2.957380 3.102651e-03
8  RIGGED_SYSTEM_5_2016  0.19025188 0.09645384  1.972466 4.855648e-02
9           wealth_2016 -0.06940523 0.02634395 -2.634580 8.424157e-03
10         imiss_k_2016 -0.18103020 0.08272555 -2.188323 2.864611e-02
11       econtrend_2016 -0.29536980 0.08722417 -3.386330 7.083422e-04
12         imiss_f_2016 -0.32328040 0.10543220 -3.066240 2.167694e-03
13         imiss_g_2016 -0.33203385 0.07867346 -4.220405 2.438640e-05
14         imiss_n_2016 -0.44161183 0.09003981 -4.904628 9.360434e-07
```

Notes: If you look at what these survey questions are, you'll see that when a respondent thinks that crime is an important issue, tabulated in the column `imiss_a_2016`, they are less likely to vote but when a respondent thinks that infrastructure improvements are an important issue, the column `imiss_n_2016`, they are more likely to vote.

---

# Let's build some models!✨

Notes: Now that you have explored your data and have some understanding of it, it's time to move into preparing for machine learning.

