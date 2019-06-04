---
type: slides
---

# Welcome!

Julia Silge
Data Scientist at Stack Overflow

Notes: Hi! I'm Julia Silge, and welcome to "Case Studies in Supervised Learning in R". Supervised machine learning, otherwise known as predictive modeling, is a powerful tool for using data to make predictions about the world around us. 


---

# In this course, you will...

- use exploratory data analysis to prepare for predictive modeling
- explore which modeling approaches to use for different kinds of data
- practice implementing supervised machine learning for classification and regression

Notes: Once you understand the basics of supervised machine learning, the next step is to practice your skills so you can apply these techniques wisely and appropriately. We are going to practice how to implement regression and classification, when to use each, and how to use exploratory data analysis to prepare for training models.



---

# Supervised machine learning

- Regression
- Classification

Notes: The two types of models we'll train in this course are regression and classification. Think of regression models as predicting numeric, continuous quantities and classification models as predicting discrete quantities or class membership or labels.

---

# Case studies

- Fuel efficiency for cars
- Stack Overflow Developer Survey 
- Voter turnout 
- Predict age of nuns from survey responses 

Notes: In this course, you will work through four case studies using data from the real world. First, a dataset on fuel effiency of cars. 

Second, the annual Stack Overflow Developer Survey where we will predict whether a developer works remotely or not. 

Next, a survey on voter attitudes where we will predict voter turnout. 

And lastly, a large survey of nuns (yes, you heard that right, nuns) where you will predict the age of the nuns from their responses on the survey. Each of these case studies will provide you the opportunity to practice your data handling and model training skills. Some of these datasets are large enough that it is not realistic to work with them in their entirety for all parts of a machine learning workflow here on the DataCamp platform, so in those cases you'll work with subsets of these datasets. I'll be sure to point out when that occurs.

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

Notes: In this first case study, we are going to use the mtcars dataset to train regression models. No, I'm kidding! I would never do that to you! I can only imagine that you are as sick of mtcars as I am.

---

# Fuel efficiency

From the [US Department of Energy](https://www.fueleconomy.gov/feg/download.shtml)

```out
> cars2018

# A tibble: 1,144 x 15
   Model          `Model Index` Displacement Cylinders Gears Transmission   MPG
   <chr>                  <dbl>        <dbl>     <dbl> <dbl> <chr>        <dbl>
 1 Acura NSX               57.0         3.50      6.00  9.00 Manual        21.0
 2 ALFA ROMEO 4C          410           1.80      4.00  6.00 Manual        28.0
 3 Audi R8 AWD             65.0         5.20     10.0   7.00 Manual        17.0
 4 Audi R8 RWD             71.0         5.20     10.0   7.00 Manual        18.0
 5 Audi R8 Spyde…          66.0         5.20     10.0   7.00 Manual        17.0
 6 Audi R8 Spyde…          72.0         5.20     10.0   7.00 Manual        18.0
 7 Audi TT Roads…          46.0         2.00      4.00  6.00 Manual        26.0
 8 BMW M4 DTM Ch…         488           3.00      6.00  7.00 Manual        20.0
 9 Bugatti Chiron          38.0         8.00     16.0   7.00 Manual        11.0
10 Chevrolet COR…         278           6.20      8.00  8.00 Automatic     18.0
# ... with 1,134 more rows, and 8 more variables: Aspiration <chr>, `Lockup
#   Torque Converter` <chr>, Drive <chr>, `Max Ethanol` <dbl>, `Recommended
#   Fuel` <fct>, `Intake Valves Per Cyl` <dbl>, `Exhaust Valves Per Cyl` <dbl>,
#   `Fuel injection` <chr>
```

Notes: Instead, we are going to use a dataset of real cars from today. This data is from the United States Department of Energy, and tabulates how much gas new cars use per mile, along with many characteristics of these cars, like the size of the engine, the type of transmission, the type of fuel injecton, and so forth. There's a lot more here than in mtcars, and just a lot more cars, and it's not from the 1970s.

---

# Fuel efficiency


From the [US Department of Energy](https://www.fueleconomy.gov/feg/download.shtml)

```out
> names(cars2018)

 [1] "Model"                   "Model Index"            
 [3] "Displacement"            "Cylinders"              
 [5] "Gears"                   "Transmission"           
 [7] "MPG"                     "Aspiration"             
 [9] "Lockup Torque Converter" "Drive"                  
[11] "Max Ethanol"             "Recommended Fuel"       
[13] "Intake Valves Per Cyl"   "Exhaust Valves Per Cyl" 
[15] "Fuel injection"
```

Notes: Notice that some of these column names have spaces in them; you may not have run into that before. R can handle some weird characters in variable names.

---

# Special characters in variable names

```r
> cars2018 %>%
+     select(`Fuel injection`)

# A tibble: 1,144 x 1
   `Fuel injection`              
   <chr>                         
 1 Direct ignition               
 2 Direct ignition               
 3 Direct ignition               
 4 Direct ignition               
 5 Direct ignition               
 6 Direct ignition               
 7 Direct ignition               
 8 Direct ignition               
 9 Multipoint/sequential ignition
10 Direct ignition               
# ... with 1,134 more rows
```

Notes: And we deal with them by surrounding the variable name with backticks when we need to access it.

---

# Exploratory data analysis

![tidyverse](http://s3.amazonaws.com/assets.datacamp.com/production/repositories/1918/datasets/1b8cb74ef89e0981385bd422e79e3050eaeaa8aa/tidyverse.png)

Notes: A hugely important part of any modeling approach is exploratory data analysis. In this course, we'll be using tidyverse packages for getting to know your data, manipulating it, and visualizing it. The tidyverse is a collection of R packages designed for data science that share common APIs and an underlying philosophy.

---

# Exploratory data analysis

`library(tidyverse)`

- **ggplot2**
- **dplyr**
- **tidyr**
- others!

To learn more about the tidyverse, visit this [page](https://www.datacamp.com/tidyverse-tutorials).

Notes: When you type "library(tidyverse)", what you're doing is loading this collection of related packages for handling data using tidy data principles. These packages include ggplot2 for data visualization, and dplyr and tidyr for data manipulation and transformation. During this course, I'll point out when we use functions from these different packages. I typically load the tidyverse packages all at once in my daily work because these functions all work together and are so convenient for dealing with real world data.

---

#  Time to train some models!

Notes: OK, it's time to get started with our first case study. Let's take this updated fuel efficiency data and practice some machine learning skills.





















