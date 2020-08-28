---
type: slides
---

# Welcome to supervised machine learning case studies in R! 👋


Notes: Hi! I'm Julia Silge, and I built this free interactive course so you can learn more about supervised machine learning. Supervised machine learning, otherwise known as predictive modeling, is a powerful tool for using data to make predictions about the world around us. 


---

# In this course, you will...

- use exploratory data analysis to prepare for predictive modeling
- explore which modeling approaches to use for different kinds of data
- practice implementing supervised machine learning for classification and regression

Notes: This course is intended for learners who have already been exposed to some introductory ideas about predictive modeling. Once you understand the basics of supervised machine learning, the next step is to **practice your skills** so you can apply these techniques wisely and appropriately. We are going to practice how to implement regression and classification, when to use each, and how to use exploratory data analysis to prepare for training models.



---

# Supervised machine learning

- Regression
- Classification

Notes: The two types of models we'll train in this course are **regression** and **classification**. Think of regression models as predicting numeric, continuous quantities and classification models as predicting discrete quantities or class membership or labels.

---

# Case studies

- Fuel efficiency for cars
- Stack Overflow Developer Survey 
- Voter turnout 
- Predict age of nuns from survey responses 

Notes: In this course, you will work through four case studies using data from the real world. 

First, a dataset on fuel effiency of cars. 🚙

Second, the annual Stack Overflow Developer Survey where we will predict whether a developer works remotely or not. 💻

Next, a survey on voter attitudes where we will predict voter turnout. 🗳

And lastly, a large survey of nuns (yes, that's right -- nuns) where you will predict the age of the nuns from their responses on the survey. ⛪

Each of these case studies will provide you the opportunity to practice your data handling and model training skills. Some of these datasets are large enough that it is not realistic to work with them in their entirety for all parts of a machine learning workflow here in this browser environment, so in those cases you'll work with subsets of these datasets. I'll be sure to point out when that occurs.

---

# Fuel efficiency


```out
> mtcars

                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
```

Notes: In this first case study, we are going to use the mtcars dataset to train regression models. 

No, I'm kidding! 😜 I would never do that to you! I can only imagine that *you* are as sick of mtcars as *I* am. 😩

---

# Fuel efficiency

From the [US Department of Energy](https://www.fueleconomy.gov/feg/download.shtml)

```out
> cars2018

# A tibble: 1,144 x 15
   model model_index displacement cylinders gears transmission   mpg aspiration
   <fct>       <dbl>        <dbl>     <dbl> <dbl> <fct>        <dbl> <fct>     
 1 Acur…          57          3.5         6     9 Manual          21 Turbochar…
 2 ALFA…         410          1.8         4     6 Manual          28 Turbochar…
 3 Audi…          65          5.2        10     7 Manual          17 Naturally…
 4 Audi…          71          5.2        10     7 Manual          18 Naturally…
 5 Audi…          66          5.2        10     7 Manual          17 Naturally…
 6 Audi…          72          5.2        10     7 Manual          18 Naturally…
 7 Audi…          46          2           4     6 Manual          26 Turbochar…
 8 BMW …         488          3           6     7 Manual          20 Turbochar…
 9 Buga…          38          8          16     7 Manual          11 Turbochar…
10 Chev…         278          6.2         8     8 Automatic       18 Naturally…
# … with 1,134 more rows, and 7 more variables: lockup_torque_converter <fct>,
#   drive <fct>, max_ethanol <dbl>, recommended_fuel <fct>,
#   intake_valves_per_cyl <dbl>, exhaust_valves_per_cyl <dbl>,
#   fuel_injection <fct>
```

Notes: Instead, we are going to use a dataset of real cars from today. This data is from the United States Department of Energy, and tabulates how much gas new cars use per mile, along with many characteristics of these cars, like the size of the engine, the type of transmission, the type of fuel injecton, and so forth. There's a lot more here than in `mtcars`, and just a lot more cars, and...it's not from the 1970s!

---

# Exploratory data analysis

![tidyverse](https://github.com/juliasilge/supervised-ML-case-studies-course/blob/master/img/tidyverse_small.png?raw=true)

Notes: A hugely important part of any modeling approach is exploratory data analysis. In this course, we'll be using [tidyverse](https://www.tidyverse.org/) packages for getting to know your data, manipulating it, and visualizing it. The tidyverse is a collection of R packages designed for data science that share common APIs and an underlying philosophy. 💖

---

# Exploratory data analysis

`library(tidyverse)`

- **ggplot2**
- **dplyr**
- **tidyr**
- others!

To learn more about the tidyverse, visit this [page](https://www.tidyverse.org/learn/).

Notes: When you type `library(tidyverse)`, what you're doing is loading this collection of related packages for handling data using tidy data principles. These packages include ggplot2 for data visualization, and dplyr and tidyr for data manipulation and transformation. During this course, I'll point out when we use functions from these different packages. 

I typically load the tidyverse packages all at once in my daily work because these functions all work together and are so convenient for dealing with real world data.

---

#  Time to train some models! 🕚 

Notes: OK, it's time to get started with our first case study. Let's take this updated fuel efficiency data and practice some machine learning skills.





















