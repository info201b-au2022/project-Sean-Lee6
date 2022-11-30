#Sean Lee Chart 1
library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)

#Cholera data
cholera <- read.csv("data/data_cholera_infection_rate.csv")

#Handwashing data
handwash <- read.csv("data/data_handwash.csv")

#Population data
population <- read.csv("data/data_country_population.csv")

#Convert Years to rows
population_filtered <- select(population, -c(Country.Code, Indicator.Name, Indicator.Code)) %>%
                      gather("Year", "Population", -Country.Name)%>%
                      rename(Country =Country.Name)
#Rename columns for handwash
handwash_filtered <- slice(handwash,3:n())
names(handwash_filtered) <-  paste0(names(handwash_filtered), ",") %>%
                               str_replace("\\.1,", ", Urban") %>%
                          str_replace("\\.2,", ", Rural") %>%
                          str_replace("\\,$", ", Both Rural and Urban")

#Remove Years to actual years
population_filtered$Year <- strtoi(str_replace(population_filtered$Year, "X", ""))

#Convert handwash years to rows
handwash_filtered <- rename(handwash_filtered, Countries = "X, Both Rural and Urban") %>%
                      gather("Year_and_type", "Percent", -Countries) %>%
                    separate("Year_and_type", into = c("Year","Urban_Rural_or_Both"), sep = ", ")%>%
                    rename(Country = Countries)

#Convert Percentages to integers
#String to integer function is from:
#https://www.tutorialkart.com/r-tutorial/r-convert-string-to-integer/#:~:text=To%20convert%20String%20to%20Integer%20in%20R%20programming%2C%20call%20strtoi,respect%20to%20the%20specified%20base.
handwash_filtered$Percent <- strtoi(handwash_filtered$Percent)
handwash_filtered <- filter(handwash_filtered, !is.na(handwash_filtered$Percent))

#Convert Year to actual years
handwash_filtered$Year <- strtoi(str_replace(handwash_filtered$Year, "X", ""))
      
#Join handwash_filtered and cholera
handwash_and_cholera <- inner_join(handwash_filtered, cholera)

#Join handwash_and_cholera with population_filtered, and
#create Proportion for Cholera Cases divided by Proportion of Sanitation
final_dataframe <- inner_join(handwash_and_cholera, population_filtered) %>%
                    mutate(cases_per_population = Number.of.reported.cases.of.cholera / Population * 100) %>%
                    filter(Year == 2016 | Year == 2015 | Year == 2014 | Year ==2013 | Year == 2012 | Year == 2011| Year == 2010 )

#Make our ggplot2 chart
chart_1 <- ggplot(data = final_dataframe, aes(x = Percent, y = cases_per_population)) +
                    geom_point(alpha = .4, color = "seagreen") +
                    geom_smooth()+facet_wrap(~Urban_Rural_or_Both) + 
                    xlab("Percentage of People with Access to Clean Services") +
                    ylab("Reported Cases of Cholera per Population of Country") +
                  # I got the scales::comma lable from:
                  #https://stackoverflow.com/questions/52602503/display-an-axis-value-in-millions-in-ggplot
                  #Square root scale is from:
                  #https://ggplot2-book.org/scales-guides.html
                    scale_y_sqrt(labels = scales::comma) + 
                    labs(title = "Percent of Access to Clean Services vs Percent of Reported Cases of Cholera per Country Population", 
                        subtitle = "Relationship between clean services and reported cases from 2010 to 2016", 
                        caption = "This chart was created to access the relation 
                        between the percentage of people in a country with 
                        access to clean handwashing services and the reported cases of cholera per population of country. 
                        Our initial belief was that there would be a negative correlation
                        between the two variables as more access to clean handwashing services 
                        reduces the risk of diseases. The graph suggests a non-linear 
                        relationship, but with a general negative trend.")

                    
chart_1
