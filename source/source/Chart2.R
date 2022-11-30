#Mynah Chart 2
library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)


#Handwashing data
handwash <- read.csv("../data/data_handwash.csv")

#Rename columns for handwash
handwash_for_chart_two <- slice(handwash,3:n())
names(handwash_for_chart_two) <-  paste0(names(handwash_for_chart_two), ",") %>%
  str_replace("\\.1,", ", Urban") %>%
  str_replace("\\.2,", ", Rural") %>%
  str_replace("\\,$", ", Both Rural and Urban")
handwash_for_chart_two <- rename(handwash_for_chart_two, Countries = "X, Both Rural and Urban") %>%
  gather("Year_and_type", "Percent", -Countries) %>%
  separate("Year_and_type", into = c("Year","Urban_Rural_or_Both"), sep = ", ")%>%
  rename(Country = Countries)
#Convert Percentages to integers
#String to integer function is from:
#https://www.tutorialkart.com/r-tutorial/r-convert-string-to-integer/#:~:text=To%20convert%20String%20to%20Integer%20in%20R%20programming%2C%20call%20strtoi,respect%20to%20the%20specified%20base.
handwash_for_chart_two$Percent <- strtoi(handwash_for_chart_two$Percent)
handwash_for_chart_two <- filter(handwash_for_chart_two, !is.na(handwash_for_chart_two$Percent))

#Convert Year to actual years
handwash_for_chart_two$Year <- strtoi(str_replace(handwash_for_chart_two$Year, "X", ""))

handwash_for_chart_two <- handwash_for_chart_two %>%  filter(Urban_Rural_or_Both == "Both Rural and Urban") %>%
  group_by(Year) %>%
  summarize(Percent = mean(Percent))
total_handwashing_plot <- handwash_for_chart_two %>%
  ggplot(aes(x = Year, y = Percent)) + 
  geom_line(alpha = .4, color = "seagreen") + 
  xlab("Date") +
  ylab("Percentage of People with Access to Handwashing Services") +
  scale_y_sqrt(labels = scales::comma) + 
  labs(title = "Average total percentage of Handwashing Access per Year",
       subtitle = "Relationship between Handwashing Service Accessibility and Date",
       caption = " This chart was created to determine the correlation between handwashing access and time.
                  This will help people visualize how handwashing access has developed over the past years.
                  We initially thought that the graph would show very visible positive growth, however,
                  we can now see how their are quite a few dips in the chart that we did not expect.It is observed
                  how the chart does seem to be levelling out in the recent years. This answers our 
                  question #2 of if access to handwashing services has increased over time.")
total_handwashing_plot


#  Old code
# # total handwashing with soap
# 
# total_handwashing <- read.csv("data/data_handwash.csv") %>%
#   select('...1', `2020...2`, `2019...5`, `2018...8`, `2017...11`, `2016...14`, `2015...17`, `2014...20`, `2013...23`, `2012...26`, `2011...29`, `2010...32`, `2009...35`, `2008...38`, `2007...41`, `2006...44`, `2005...47`, `2004...50`, `2003...53`, `2002...56`, `2001...59`)
# total_handwashing<- rename(total_handwashing, countries = '...1')
# total_handwashing <- rename( total_handwashing, '2020' = '2020...2', '2019' = `2019...5`,  '2018' = `2018...8`, '2017' = `2017...11`,  '2016' = `2016...14`, '2015' = `2015...17`, '2014' = `2014...20`, '2013' = `2013...23`, '2012' = `2012...26`, '2011' = `2011...29`, '2010' = `2010...32`, '2009' = `2009...35`, '2008' = `2008...38`, '2007' = `2007...41`, '2006' = `2006...44`, '2005' = `2005...47`, '2004' = `2004...50`, '2003' = `2003...53`, '2002' = `2002...56`, '2001' = `2001...59` )
# View(total_handwashing)
# 
# total_handwashing = total_handwashing[-1, ]
# 
# total_handwashing <- total_handwashing %>%
#   pivot_longer(-c('countries'), names_to = "date", values_to = "total_percentage")
# View(total_handwashing)
# 
# total_handwashing = total_handwashing[-1:-20, ]
# 
# total_handwashing <- na.omit(total_handwashing)
# View(total_handwashing)
# 
# total_handwashing$total_percentage <- strtoi(total_handwashing$total_percentage)
# total_handwashing$date <- strtoi(total_handwashing$date)
# 
# total_handwashing <- total_handwashing %>%
#   group_by(countries, date) %>%
#   summarise(total_percentage = sum(total_percentage)) %>%
#   ungroup()
# 
# total_handwashing <- total_handwashing %>%
#   group_by(date) %>%
#   summarise(total_percentage = mean(total_percentage))
# 
# 
# total_handwashing_plot <- total_handwashing %>%
#   ggplot(aes(x = date, y = total_percentage)) + 
#   geom_line(alpha = .4, color = "seagreen") + 
#   xlab("Date") +
#   ylab("Percentage of People with Access to Handwashing Services") +
#   scale_y_sqrt(labels = scales::comma) + 
#   labs(title = "Average total percentage of Handwashing Access per Year",
#        subtitle = "Relationship between Handwashing Service Accessibility and Date",
#        caption = " This chart was created to determine the correlation between handwashing access and time.
#                   This will help people visualize how handwashing access has developed over the past years.
#                   We initially thought that the graph would show very visible positive growth, however,
#                   we can now see how their are quite a few dips in the chart that we did not expect.It is observed
#                   how the chart does seem to be levelling out in the recent years. This answers our 
#                   question #2 of if access to handwashing services has increased over time.")
# total_handwashing_plot
