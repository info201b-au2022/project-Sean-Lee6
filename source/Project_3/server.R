#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)
library(tidyverse)
library(ggplot2)
library(plotly)

#Data
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
  mutate(cholera_percent = 
           Number.of.reported.cases.of.cholera / Population * 100) %>%
  filter(Year == 2016 | Year == 2015 | Year == 2014 | Year ==2013 | Year == 2012 | Year == 2011| Year == 2010 )

server <-function(input, output) {
  
  #I learned how to render a pre-image from:
  #https://medium.com/@traffordDataLab/alt-text-for-dynamic-plots-in-shiny-2e24c684f187
  output$sanitation_image <- renderImage({
    list(src = "www/sanitation_pic2.jpg",
         contentType = 'image/jpg',
         width = 600,
         height = 400,
         alt = "Image source: https://jamunitedkingdom.co.uk/programmes-and-campaigns/water-and-sanitation/")
  }, deleteFile = FALSE)
  
  #Reactive expression for user input for region
  reactive_region <- reactive({input$region})

  #The visualization
  output$plot <- renderPlotly({

    #We want to further filter for region type
    final_dataframe <- final_dataframe %>%
      filter(Urban_Rural_or_Both == input$region)
    
    #The actual visualization
    ggplotly(ggplot(data = final_dataframe,
                    aes(x = Percent,
                         y = cholera_percent))+
                                                       
                  geom_point(alpha = .4, color = "seagreen") +
                  geom_smooth() + 
                  xlab("Percentage of People with Access to Clean Services (%)") +
                  ylab("Reported Cases of Cholera
                       per Population of Country (%)") +
                  scale_y_sqrt(labels = scales::comma))})
}
