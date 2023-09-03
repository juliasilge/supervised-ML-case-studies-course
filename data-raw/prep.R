library(tidyverse)
library(readxl)

cars2018 <- read_excel("2018 FE Guide for DOE-release dates before 12-14-2017-no-sales-12-12-2017public.xlsx", sheet = 1) %>%
    unite(Model, Division, Carline, sep = " ") %>%
    select(Model, 
           `Model Index` = `Index (Model Type Index)`,
           Displacement = `Eng Displ`,
           Cylinders = `# Cyl`,
           Gears = `# Gears`,
           Transmission = `Trans Desc`,
           MPG = `Comb FE (Guide) - Conventional Fuel`,
           Aspiration = `Air Aspiration Method Desc`,
           `Lockup Torque Converter`,
           Drive = `Drive Desc`,
           `Max Ethanol` = `Max Ethanol % - Gasoline`,
           `Recommended Fuel` = `Fuel Usage Desc - Conventional Fuel`,
           `Intake Valves Per Cyl`,
           `Exhaust Valves Per Cyl`,
           `Fuel injection` = `Fuel Metering Sys Desc`) %>%
    mutate(Transmission = case_when(str_detect(Transmission, "Automatic") ~ "Automatic",
                                    str_detect(Transmission, "Continuously") ~ "CVT",
                                    str_detect(Transmission, "Manual") ~ "Manual"),
           Aspiration = case_when(str_detect(Aspiration, "charged") ~ "Turbocharged/Supercharged",
                                  TRUE ~ Aspiration),
           Drive = case_when(str_detect(Drive, "Part-time") ~ "4-Wheel Drive",
                             TRUE ~ Drive),
           `Recommended Fuel` = case_when(str_detect(`Recommended Fuel`, "Mid Grade") ~ "Regular Unleaded Recommended",
                                          TRUE ~ str_extract(`Recommended Fuel`, "\\((.*?)\\)")),
           `Recommended Fuel` = str_replace_all(`Recommended Fuel`, "\\(|\\)", ""),
           `Recommended Fuel` = factor(`Recommended Fuel`,
                                       levels = c("Regular Unleaded Recommended",
                                                  "Premium Unleaded Recommended",
                                                  "Premium Unleaded Required")),
           `Fuel injection` = case_when(str_detect(`Fuel injection`, "Spark") ~ "Direct ignition",
                                        TRUE ~ "Multipoint/sequential ignition")) %>%
    filter(!is.na(`Max Ethanol`)) %>%
    mutate_if(is.character, factor) %>%
    janitor::clean_names()

cars2018 %>%
    write_rds(here::here("data", "cars.rds"))

#---------------------------------------------------------------------#

read_csv("stackoverflow.csv") %>%
    select(-respondent) %>% 
    na.omit() %>%
    write_rds(here::here("data", "stack_overflow.rds"))

#---------------------------------------------------------------------#

voters_raw <- read_csv("VOTER_Survey_December16_Release1.csv") %>%
    filter(!is.na(turnout16_2016)) %>%
    select(case_identifier, 
           turnout16_2016,
           contains("RIGGED_SYSTEM"),
           track_2016,
           persfinretro_2016,
           econtrend_2016,
           Americatrend_2016,
           futuretrend_2016,
           wealth_2016,
           values_culture_2016,
           US_respect_2016,
           trustgovt_2016,
           trust_people_2016,
           helpful_people_2016,
           fair_people_2016,
           contains("imiss_"),
           -contains("rnd"),
           -contains("baseline"))


voters <- voters_raw %>%
    mutate(turnout16_2016 = factor(turnout16_2016, 
                                   labels = c("Voted", "Did not vote")),
           turnout16_2016 = fct_relevel(turnout16_2016, "Did not vote"))

voters <- voters[complete.cases(voters),]

voters %>%
    write_rds(here::here("data", "voters.rds"))

#---------------------------------------------------------------------#