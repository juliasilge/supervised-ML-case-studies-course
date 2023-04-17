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



#---------------------------------------------------------------------#



#---------------------------------------------------------------------#