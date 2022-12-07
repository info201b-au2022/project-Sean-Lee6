
library(shiny)
library(tidyverse)
library(stringr)
library(ggplot2)
library(plotly)

#Introduction Tab
intro <- tabPanel(
  "Introduction",
  titlePanel(strong("Sanitation in Different Countries")),
  image <- imageOutput("sanitation_image"),
  
  #To make the captions specifically smaller without having to readjust my
  #CSS stylings, I found how to do so from:
  #https://stackoverflow.com/questions/55011733/modify-text-size-in-shiny
  p(em("Figure 1. Many third world countries such as the countries in the
  Middle East and Africa have substantially less accessibility to clean
  sanitation services. This may lead to increased risks of getting cholera."),
    style = "font-size: 16px;"),
  p(em("(Image source: https://jamunitedkingdom.co.uk/programmes-and-campaigns/water-and-sanitation/)"),
    style = "font-size: 16px"),
  HTML("<br><br>"),
  h3(strong("Brief")),
  p("Access to clean water and sanitation is a privilege that most first world
    countries have. However, not all countries in the world are able to provide
    sanitation services to some or all of their citizens. Additionally, not all
    people in the world are able to afford clean water and sanitation. As a
    result, the people who can't afford these services may have a higher risk of
    obtaining diseases such as diarrhea and cholera."),
  
  HTML("<br>"),
  h3(strong("Problem Domain")),
  p("The focus on this project is access to Sanitation Services, and its
    relationship to cholera infection rates. By analyzing this subsection, we
    will tackle the human values of community, power, justice, service, and
    health. More details regarding the problem domain are discussed in the
    report panel."),
  
  HTML("<br>"),
  h3(strong("Research Question")),
  p("Our research question is:"),
  h4("What is the relationship between proportion of
    people without access to clean water, sanitation services and the proportion
    of people who get infected with cholera?"),
  p("We ask this question to determine how strong the correlation between
    proportion of access to safely managed sanitation services and cholera
    infection rates."),
  
  HTML("<br>"),
  h3(strong("Dataset")),
  p("The datasets we used are:"),
  h4("Handwashing With Soap"),
  p("This data was provided by the World Health Organization. It shows the
    percentages of people with access to clean sanitation services per country,
    per year."),
  h4("Number of Reported Cases"),
  p("This data was provided by the World Health Organization. It shows the
    number of reported cases of cholera."),
  h4("Population"),
  p("This dataset was provided by the World Bank. It contains the country
    populations which are necessary to calculate the proportion of cholera cases
    relative to country population."),
  
  HTML("<br>"),
  h3(strong("Key Findings")),
  p("We find that there is a non-linear, general negative trend between the
    percentage of people in a country with access to clean handwashing services
    and the reported cases of cholera per population. This suggests that having
    more accessibility to clean sanitation services may reduce the number of
    cholera infection rates.")
)

#Visualization Panel
viz <- tabPanel(
  "Visualization",
  titlePanel(strong("Percent of Access to Clean Services vs Percent of Reported
                    Cases of Cholera per Country Population")),
  
  #Sidebar for Choosing a particular country
  sidebarPanel(
    region <- selectInput("region", "Enter Type of Region",
                          choices = list("Rural" = "Rural", "Urban" = "Urban",
                          "Both Rural and Urban" = "Both Rural and Urban"),
                          selected = "Both Rural and Urban")
  ),
  mainPanel(
    h4(strong("Relationship between Cleaning Service Accessibility and
    Reported Cases of Cholera from 2010 to 2016")),
    plot <- plotlyOutput("plot"),
    p("This chart was created to access the relation 
      between the percentage of people in a country with 
      access to clean handwashing services and the reported cases of cholera per
      population of country. Each point represents a country with their percent
      of reported cases of cholera. The percent of people with access to clean
      sanitation services, for each country, is factored into three region types
      : rural, urban, or both rural and urban. Our initial belief was that there
      would be a negative correlation between the two variables as more access
      to clean handwashing services reduces the risk of diseases. The graph
      suggests a non-linear relationship, but with a general negative trend
      amongst all region types of rural, urban, or both.")
  )
)

takeaway <- tabPanel(
  "Takeaway",
  titlePanel("Summary Takeaways"),
  h3("Takeaway 1"),
  p("When considering the region type of each country, we note a more \"skewed
    right\" distribution in the percentage of reported cases of cholera per
    country population for rural regions compared to urban regions, as well as a
    higher peak of expected percentage of reported cholera cases. For rural
    regions, we see the highest expected percentage of reported cases of cholera
    (about .260%) corresponds to countries whose rural regions have about 20%
    of people having access to clean sanitation services."),
  h3("Takeaway 2"),
  p("Conversely, we see that for urban regions, the highest expected percentage
  of reported cases of cholera (about .197%) corresponds to countries whose
  urban regions have about 37% of people having access to clean sanitation
    services. This shows that rural regions with lower proportions of people
    with access to clean sanitation services have a higher expected percentage
    of reported cholera cases compared to urban regions. Additionally, this
    implies that rural regions generally have lower percentages of people with
    access to clean sanitation services."),
  h3("Takeaway 3"),
  p("To answer our main question regarding the relationship between
    accessibility and cholera cases, the graph shows a nonlinear negative trend
    between the percentage of people with access to clean sanitation services
    and the percentage of reported cases of cholera per country population.
    A possible reason why the
    relationship isn't linear is because we are only given the reported cases.
    It may be possible for countries to under-report the number of cholera cases
    for a multitude of reasons (a possible factor could be lack of access to
    health case), but more research is needed to verify this claim."),
  h4("Caveats"),
  p("One caveat we should discuss is that the number of reported cases per
    country population does not take into account the regions of which the
    reported cases came from (It's only cumulative). If possible, this data can
    be used to better plot the dependent variable for our respective charts.")
)

report <- tabPanel(
  "Report",
  
  #Title and Name, etc.
  h2(strong("Water, and its Factors in Different Countries")),
  h4(strong("Code name: Water")),
  h3(strong("Sean Lee")),
  h4("Affiliation: Technical Foundations of Informatics - The Information School - University of Washington"),
  h4("Date: Autumn 2022"),
  
  #Abstract and keywords
  h3(strong("Abstract")),
  p("Our main question is if there is a correlation between poverty,
  access to clean water and sanitation methods, and diagnosis of disease and infection.
  This question is important because lots of third world countries don't have
  proper access to clean water and sanitation services so people in these areas
  may be at high risk of contracting diseases such as cholera, and diarrheal
  disease. To address the question, we will analyze each data set
  (handwash rate and cholera infection rate) and analyze the correlations
  we see between these data sets."),
  h4("Keywords"),
  p("Keywords: Sanitation Services, Access to Clean Water, Diarrheal Diseases"),
  HTML("<br><br>"),
  
  #Introduction
  h3(strong("Introduction")),
  p("Access to clean water and sanitation is a privilege that most first world
  countries have. However, not all countries in the world are able to provide
  sanitation services to some or all of their citizens. Additionally, not all
  people in the world are able to afford clean water and sanitation. As a
  result, the people who can't afford these services have resorted to less
  hygienic means, including using unclean water, hand washing without soap,
  open defecation, and more. Clean water and sanitation services are important
  because they help promote good hygiene, and prevent germs and diseases from
  spreading. Unclean water and sanitation services may not only be ineffective
  against preventing diseases and infections; they may also cause them, as many
  people die from diarrhea and cholera caused by drinking unclean water. With
  this in mind, we have decided to research the issue of inequitable access to
  sanitation services."),
  
  HTML("<br><br>"),
  #Problem Domain
  h3(strong("Problem Domain")),
  h4("Subsections and Human Values"),
  p("The focus on this project is access to Sanitation Services, and its
    relationship to cholera infection rates. By analyzing this subsection, we
    will tackle the human values of community, power, justice, service, and
    health."),
  h4("Harms and Benefits"),
  p("While there isn't much harm in addressing these issues, a challenge is that
    many of the issues regarding accessibility to sanitation services comes from
    the issue of poverty. Thus, we must consider how poverty intersects with
    equitable access to sanitation services, and how to create solutions around
    it."),
  p("A benefit is that by increasing accessibility to clean sanitation services,
    the number of preventable diseases can be greatly reduced. Clean hygiene
    plays a paramount role in preventing infectious diseases, and thus clean
    sanitation services help achieve that."),
  h6("(For related works on these issues, see the references section below.)"),
  h4("Stakeholders"),
  tags$ol(
    tags$li("The direct stakeholders are the people who don't have access to
            clean sanitation services. By providing awareness to this issue,
            we hope more people can access clean water and sanitation."),
    tags$li("The indirect stakeholders are government officials and sanitation
            service providers.")),
  HTML("<br>"),
  
  #Research Question
  h3(strong("Research Question")),
  p("Our research question is:"),
  h4("What is the relationship between proportion of
    people without access to clean water, sanitation services and the proportion
    of people who get infected with cholera?"),
  p("We ask this question to determine how strong the correlation between
    proportion of access to safely managed sanitation services and cholera
    infection rates."),
  HTML("<br>"),
  
  #Datasets
  h3(strong("Dataset")),
  p("The datasets we used are:"),
  h4("Handwashing With Soap"),
  h6(em("World Health Organization. (n.d.). Gho | by category | handwashing with
        SOAP - data by country. World Health Organization. Retrieved October 31,
        2022, from")),
  h6(em("https://apps.who.int/gho/data/node.main.WSHHYGIENE?lang=en")),
  p("This data was provided by the World Health Organization. It shows the
    percentages of people with access to clean sanitation services per country,
    per year."),
  h4("Number of Reported Cases"),
  h6(em("World Health Organization. (n.d.). Gho | by category | number of
        reported cases - data by country. World Health Organization. Retrieved
        October 31, 2022, from")),
  h6(em("https://apps.who.int/gho/data/node.main.175?lang=en")),
  p("This data was provided by the World Health Organization. It shows the
    number of reported cases of cholera."),
  h4("Population"),
  h6(em("Population, total. Data Last Updated 9/16/2022. Retrieved November 14,
        2022, from")),
  h6(em("https://data.worldbank.org/indicator/SP.POP.TOTL")),
  p("This dataset was provided by the World Bank. It contains the country
    populations which are necessary to calculate the proportion of cholera cases
    relative to country population."),
  HTML("<br><br>"),

  #Findings
  h3(strong("Key Findings")),
  p(" As stated in our summary takeaways, we find that the
    percentages of people with access to clean sanitation services are lower
    in rural regions compared to urban regions. This means rural regions
    are more statistically likely to have less accessibility when it comes to
    sanitation services. This ties in with our inference that the accessibility
    of clean sanitation services may be possibly influenced by poverty as a
    confounding variable; rural regions generally have higher rates of poverty,
    and thus might not have as much tools necessary for providing their citizens
    the cleaning services needed for proper hygeine."),
  p("For our findings
    regarding the relationship of
    sanitation access and cholera rates, we find that there is
    a non-linear, general negative trend between the
    percentage of people in a country with access to clean handwashing services
    and the reported cases of cholera per population. This suggests that having
    more accessibility to clean sanitation services may reduce the number of
    cholera infection rates."),

  #Discussion
  h3(strong("Discussion")),
  p("Our findings reveal the inequal pattern between lack of access to clean
    washing services and rates of cholera. With this, we state the importance
    of making clean sanitation services accessible to everyone. We also find
    that rural regions have lower percentages of people with access to clean
    sanitation services compared to urban regions, suggesting that confounding
    variables including poverty may affect the accessibility for these cleaning
    services. Thus, when considering how to increase the accessibility of
    cleaning services, we may want to consider how addressing the issue of
    poverty may in turn increase the resources needed to create new sanitation
    services for people to use. We may want to focus on helping poorer regions
    with less accessibility to cleaning services first. While the data focuses
    on sanitation services, it is important to note that there are other forms
    of proper sanitation practices beyond services such as handwashing, which
    our data uses to assess the percent of people with access to sanitation
    services. When creating more sanitation services, we may want to
    additionally provide and encourage other forms of practices
    that help protect against diseases and viruses, such as providing masks."),
  p("One may argue that the cholera infection rates are low relative to their
    respective country populations. In fact, in the visualization, we find only
    three data points where the percentage of reported cases of cholera per
    population of country exceeds 1%. To respond to this, we note that while
    cholera is much more likely to be spread under lack of proper sanitation
    and hygiene, it is not the only disease that can be spread due to poor
    hygienic practices. Other diseases may occur due to lack of clean sanitation
    which include, but are not limited to, other diarrheal diseases, parasitic
    diseases, and viruses such as the flu. For the purposes of our visualization
    , we chose to focus on diarrheal diseases, as lack of sanitation services
    and access to clean water is a major cause of cholera. Combining other
    diseases will increase our percentages, but we will have to be more cautious
    about determining whether our relationship is causative, or if a
    correlation simply exists between sanitation access and multiple forms of
    diseases."),
  
  #Conclusion
  h3(strong("Conclusion")),
  p("In conclusion, our purpose for this project was to identify and assess the
    relationships between sanitation and diseases. Our research question in
    particular is about the relationship between accessibility to clean
    sanitation services and the reported rate of cholera cases. Our research
    question is important, as we hope to determine whether sanitation negatively
    correlates with diarrheal diseases."),
  p("We identified a
    non-linear negative trend between sanitation accessibility and cholera
    cases. Additionally, we found that rural regions in general have lower
    percentages of people with access to sanitation services compared to urban
    regions. These findings are important, as it implies that lack of
    accessibility to sanitation services has a positive correlation with a
    higher percentage of cholera cases. As a result, countries with lower
    percentages of people with access to sanitation services are expected to
    have higher rates of cholera cases. In particular, since rural regions in
    general have lower rates of people with access to cleaning services, they
    will have higher expected percentages of cholera cases compared to urban
    regions."),
    p("While as of recent times, cholera percentages per country are generally
      below 1%, we find our results to be significant, as illnesses related to
      sanitation issues such as cholera are largely preventable through proper
      sanitation and hygiene, and our visualization reflects this relationship
      through the decreased percentage of cholera cases in correspondence with
      higher percentages of sanitation accessibility. Furthermore, cholera is
      not the only type of diseases that has a higher chance of occurring as a
      result of lack of sanitation services and/or poor sanitation practices, as
      diseases like the flu may also have a positive correlation with lack of
      clean sanitation resources."),
  p("Thus, we hope to use these findings to show the importance and necessity of
    sanitation accessibility. As rural regions of many third world countries
    generally have less resources available for sanitation services, we suggest
    for more allocation of resources to these regions. We infer that poverty may
    influence the amount of resources available for cleaning services as well.
    This is because rural regions generally tend to have higher rates of poverty
    compared to urban region. This in turn may influence the number of people
    with access to sanitation services.
    Clean water and sanitation is important for protection against preventable
    diseases such as cholera, and thus we hope to bring awareness and increase
    the accessibility of cleaning services to people throughout the world."),
  h3(strong("Acknowledgement")),
  p("The project proposal was created alongside with Mynah Shetty, Ryan Louie,
  and Christopher Chen."),
  HTML("<br><br>"),
  
  #References
  h3(strong("References")),
  h4("Related Works"),
  tags$ol(
    tags$li(h6(em("MediLexicon International. (n.d.). The impact of water poverty in the
  United States. Medical News Today. Retrieved October 31, 2022, from")),
  h6(em("https://www.medicalnewstoday.com/articles/how-water-poverty-impacts-public-health-in-the-us")),
            p("This illustrates that even though the US is a 1st world country, water
    still goes untreated because of poverty and mismanagement. This situation
    is much worse in countries that are lacking in economy and power.")),
    tags$li(h6(em("
  Djantchiemo, S., &amp; White, T. (2022, March 25). Figure of the week:
  Access to water, sanitation, and hygiene (WASH) services in sub-Saharan africa
  . Brookings. Retrieved October 31, 2022, from")),
            h6(em("https://www.brookings.edu/blog/africa-in-focus/2022/03/25/figure-of-the-week-access-to-water-sanitation-and-hygiene-wash-services-in-sub-saharan-africa/")),
            p("This source presents sources about Africa as a continent, comparing it to
  different places around the world. Overall, it concludes that the water
  facilities are below average. It targets a specific problem (Covid-19) which
  affected the water and hygiene quality of many countries in Africa.")),
    tags$li(h6(em("World Bank Group. (2022, February 22). Water Supply, sanitation, and
     hygiene (WASH) poverty diagnostic initiative. World Bank. from")),
            h6(em("https://www.worldbank.org/en/topic/water/publication/wash-poverty-diagnostic")),
            p(" This source gives an overviews on how the world is trying to better water
    quality services. It focuses on regions that are in poverty."))
  ),
  

  
  
  
  h3(strong("Citations for Datasets")),
  h4("Handwashing With Soap"),
  h6(em("World Health Organization. (n.d.). Gho | by category | handwashing with
  SOAP - data by country. World Health Organization. Retrieved October 31, 2022,
  from")), 
  h6(em("https://apps.who.int/gho/data/node.main.WSHHYGIENE?lang=en")),
  
  h4("Number of Reported Cases"),
  h6(em("World Health Organization. (n.d.). Gho | by category | number of reported
  cases - data by country. World Health Organization. Retrieved October 31, 2022
  , from")),
  h6(em("https://apps.who.int/gho/data/node.main.175?lang=en")),
  
  h4("Population"),
  h6(em("Population, total. Data Last Updated 9/16/2022. Retrieved November 14,
  2022, from")),
  h6(em("https://data.worldbank.org/indicator/SP.POP.TOTL"))
  
)


ui <- navbarPage(
  "Sanitation",
  tags$head(
    tags$style(HTML("<html>
<style>
h1 {color: black;}
p {color: white; font-family: georgia, serif; font-size: 20px;}
h2  {color: darkblue; font-size: 35px;}
h3 {color: aquamarine;font-size: 30px;}
h4 {color: lightblue; font-size: 25px;}
li {color: white; font-family: georgia, serif; font-size: 20px;}
h6 {color: lightgray; font-size: 15px;}
body {background-color: teal;}
</style>
<head>
</head>
</html>"
    ))
  ),
  intro,
  viz,
  takeaway,
  report
)
