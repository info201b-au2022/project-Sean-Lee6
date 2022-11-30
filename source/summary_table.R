
library("ggplot2")
library("tidyverse")
library("stringr")
library("data.table")
#Poverty data
poverty <- read.csv("data/data_poverty.csv")

highest_poverty <- poverty %>%
  group_by(country)%>%
  filter(percPoverty >= 50.0)



table <- as.data.table(highest_poverty)


    
View (table)
