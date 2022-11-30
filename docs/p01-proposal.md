# Water, and it's Factors in Different Countries: Project Proposal
## Code name: Water


For what to do, see the [`../instructions/`](../instructions/) directory, specifically:

* [Design Brief](../instructions/project-design-brief.pdf)
* [Project Proposal Requirements](../instructions/p01-proposal-requirements.md)

## Authors:
- Ryan Louie (rlouie21@uw.edu)
- Christopher Chen (cmchen22@uw.edu)
- Sean Lee (seanl6@uw.edu)
- Mynah Shetty (mshett@uw.edu)

## Affiliation: Technical Foundations of Informatics - The Information School - University of Washington

## Date: Autumn 2022

## Abstract
Our main question is if their is a correlation between poverty, access to clean water and sanitation methods, and diagnosis of disease and infection.
This question is important because lots of third world countries don't have proper access to clean water and sanitation services so people in these areas may be at high risk of contracting diseases such as cholera, and diarrheal disease. Analyzing this correlation may lead to change access to clean water and sanitation in these countries. To address the question, we will analyze each data set (poverty rate, handwash rate, diarrheal death rate, and cholera infection rate) and analyze the correlations we see between these data sets.

## Keywords

Keywords: Sanitation Services, Access to Clean Water, Diarrheal Diseases

## Introduction

Access to clean water and sanitation is a privilege that most first world countries have. However, not all countries in the world are able to provide sanitation services to some or all of their citizens. Additionally, not all people in the world are able to afford clean water and sanitation. As a result, the people who can't afford these services have resorted to less hygienic means, including using unclean water, hand washing without soap, open defecation, and more. Clean water and sanitation services are important because they help promote good hygiene, and prevent germs and diseases from spreading. Unclean water and sanitation services may not only be ineffective against preventing diseases and infections; they may also cause them, as many people die from diarrhea and cholera caused by drinking unclean water. With this in mind, we have decided to research the issue of inequitable access to sanitation services.


## Problem Domain

The sub-sections can be split into:

- Sanitation services
- Drinking water services
- Handwashing with soap
- Open defecation

The data examines the many sources of water used for hygiene, and how the quality of water affects the spread of disease. Water is a vital part in health, and is something that needs to be addressed in communities. In our project, we look to explore countries that are struggling with water services, and focusing on pointing out patterns throughout those countries. We plan to visualize a series of graphs, as well as citing evidence from the statistics that we find.

The human values that this addresses is:

- community
- power
- justice
- service
- health

Harm: Through tackling the problems that are associated with water quality, there would be a lot less diseases being spread, and thus deaths. One harm with water quality is that a lot of the conditions stem from poverty. Because of this, solutions can be hard to come up with as a lot comes from completely changing the infrastructure.

Benefit: A lot of death and sickness can be avoided with better water quality amongst all countries. Overall, a benefit involves ethics, ensuring that clean water is a basic human right. It is the right thing to do to advocate.

Stakeholders: Here are the stakeholders:

* Direct: The people directly affected would be the ones that are using the water systems. This could be families, people, or other inhabitants.

* Indirect: The government, who are affected by the opinion of their citizens. The workers that provide the facilities as they are the ones monitoring it.

## Research Questions

For our project, we decided to ask the following questions:

### 1. What is the relationship between proportion of people without access to clean water, sanitation services and the proportion of people who get infected with cholera?

This question researches how strong the correlation between proportion of access to safely managed sanitation services and cholera infection rates.

### 2. What is the relationship between proportion of people with access to clean water, sanitation services and countries that have different rates of poverty.

We ask this question to research if there is a relation (or correlation) between the proportion of people who are able to use clean sanitation services in each country and if there is a relation to its poverty rate.

### 3. Has access to handwashing services increased over time?

We ask this question to assess the strength of the relationship between time and access to sanitation services such as handwashing. This helps with addressing the question of if handwashing services are increasing enough over time, as addressing the issue of access to sanitation services may not be increasing enough over time to keep up with growing populations in need.


## The Dataset

Our dataset is related to our project domain because it illustrates the number of cases of disease to a country, how many people fall under the poverty line, open defection rates, and handwashing rates. This can help us answer our questions on how poverty, access to clean water and sanitation methods, and diagnosis of cholera/ diarrheal disease are correlated. The data collection process of the World Health Organization is funded partly by the assessed contributions that countries pay when they join the organization, and partly by voluntary contributions from member states. Third world countries might benefit from this data because when viewers see how the conditions are they may want to make efforts towards putting policy in place to improve conditions. Non-profits also may benefit from the data because providing concrete evidence of disadvantages in certain areas may lead to more funds being raised to put back in to these areas. Data collected by the World Health Organization is cross examined across multiple sources to maintain accuracy. The WHO also uses fact sheets to keep data up to date and viewers aware if data is not updated. The methods that the World Health Organization uses, such as those previously mentioned, to maintain their data makes it credible and trustworthy. We obtained this data by following the sources on the provided design brief and looking for data sets that we found interesting. We do credit this source because of how credible we've found it to be.

=======
| File Name  | Number of rows|  Number of Variables    |
| :---        |    :----:   |          ---: |
| data_cholera_infection_rate.csv |   2470       |        3  |
|data_diarrhea_death_rate.csv   |    198   |         55       |
|data_handwash.csv  |     199    |            3      |
data_poverty.csv |      173        |          5          |



### Dataset Citations
  * World Health Organization. (n.d.). Gho | by category | handwashing with SOAP - data by country. World Health Organization. Retrieved October 31, 2022, from https://apps.who.int/gho/data/node.main.WSHHYGIENE?lang=en

The handwashing data is extremely useful, since it gives information on the proportion of people in each country that has access to clean sanitation services. We use this data for all three research questions, as they require information about how accessible clean sanitation services are in each country.

  * World Health Organization. (n.d.). Gho | by category | number of reported cases - data by country. World Health Organization. Retrieved October 31, 2022, from https://apps.who.int/gho/data/node.main.175?lang=en

The cholera dataset is useful for research question one, because in order to assess the relationship between accessibility of clean sanitations services and cholera, we need information regarding the cholera cases in each country.

* World Population Review. Poverty Rate by Country 2022. Worldpopulationreview.com. Published 2022.  Retrieved October 31, 2022, from https://worldpopulationreview.com/country-rankings/poverty-rate-by-country

This dataset is needed to calculate and divide countries into different groups based on their poverty rates. We used this to answer question two, in order to find out if there is a correlation between the poverty rate of a country, and if that affects the rate of people having access to handwashing. Because of that, it is very important in providing half the data to answer the question.

* Population, total. Data Last Updated 9/16/2022. Retrieved November 14, 2022, from https://data.worldbank.org/indicator/SP.POP.TOTL

This dataset is needed to calculate proportions for research question one. I used proportions because different countries have different population sizes, so the number of cholera cases relative to the total population would make more sense. If we used the absolute number of cholera cases, larger countries may naturally have more cholera cases.

## Expected Implications

Assuming that areas that are poverty stricken have less access to clean water, the people in the affected areas have a higher likelihood of being infected with diseases such as cholera or diarrheal disease.
**For technologists/ experts in the health and sanitation fields**, the focus would need to shift more on how to provide poverty-stricken areas with simple necessities such as access to clean water and sanitation services. Technologists would need to put out products that are affordable and can allow these areas to boil their own water so that they won’t contract such diseases.
**For designers**, implications would likely be designing affordable products and educational services for these areas to learn how. Designers would need to craft methods that would help “fix” the structural barriers these communities have to safe sanitization methods.
**For policy makers**, they need to write policy that makes sanitation methods readily available. Clean water and sanitary cleaning methods are not privileges; everyone should have the right to access these methods. Policy needs to be written whether that’s by increasing funding for materials to educate and give access to clean water and sanitation services, or by providing more job opportunities so people can afford to live healthily and without risk of contracting diseases due to the lack of sanitation.



## Limitations

A major limitation for this project is the possible existence of confounding factors. For example, natural disasters, civil unrest, or political instability could lead to lack of medicine and food, and therefore contribute to high infant/child mortality. Furthermore, the Cholera virus might be indigenous or dominant in certain areas of the world, which would influence the amount of cholera cases independently from the sanitation level. For example, a area with good sanitation might have a higher incidence of Cholera virus than somewhere else simply because the Cholera virus is more dominant in that area. Another limitation for this project is how it only focuses on two diseases, while unclean water and poverty could possibly be linked to many more. While it would be helpful to establish two connections, establishing a systemic connection between poverty, unclean water, and disease could have much larger implications. Also, having just two connections makes it more likely that this trend is simply an outlier, and could hide the truth about these alleged connections.

We will address these limitations by using the R programming language to create visualizations of this data. This way, any outliers can be spotted immediately, and potentially removed from factoring in our ultimate conclusion. For the first limitation, we could address this by highlighting countries that we know are currently going through a rough time. Furthermore, we can group countries into levels of stablity, and then visualize data from that angle. For the second limitation of how we only address two diseases, we could potentially address this by analyzing a higher amount of factors. Furthermore, the two diseases picked for our analysis are arguably related to a multitude of other illnesses. Therefore while we can't establish an absolute connection between poverty, unclear water and disease, we could still establish a very strong connection between the factors.



## References

#1
MediLexicon International. (n.d.). The impact of water poverty in the United States. Medical News Today. Retrieved October 31, 2022, from https://www.medicalnewstoday.com/articles/how-water-poverty-impacts-public-health-in-the-us

This illustrates that even though the US is a 1st world country, water still goes untreated because of poverty and mismanagement. This situation is much worse in countries that are lacking in economy and power.

#2
Djantchiemo, S., &amp; White, T. (2022, March 25). Figure of the week: Access to water, sanitation, and hygiene (WASH) services in sub-Saharan africa. Brookings. Retrieved October 31, 2022, from https://www.brookings.edu/blog/africa-in-focus/2022/03/25/figure-of-the-week-access-to-water-sanitation-and-hygiene-wash-services-in-sub-saharan-africa/

This source presents sources about Africa as a continent, comparing it to different places around the world. Overall, it concludes that the water facilities are below average. It targets a specific problem (Covid-19) which affected the water and hygiene quality of many countries in Africa.


#3
https://www.worldbank.org/en/topic/water/publication/wash-poverty-diagnostic

This sources gives an overviews on how the world is trying to better water quality services. It focuses on regions that are in poverty.

#4
Djantchiemo, S., &amp; White, T. (2022, March 25). Figure of the week: Access to water, sanitation, and hygiene (WASH) services in sub-Saharan africa. Brookings. Retrieved October 31, 2022, from https://www.brookings.edu/blog/africa-in-focus/2022/03/25/figure-of-the-week-access-to-water-sanitation-and-hygiene-wash-services-in-sub-saharan-africa/


#5
World Health Organization. (n.d.). Gho | by category | handwashing with SOAP - data by country. World Health Organization. Retrieved October 31, 2022, from https://apps.who.int/gho/data/node.main.WSHHYGIENE?lang=en

#6
World Health Organization. (n.d.). Gho | by category | open defecation - data by country. World Health Organization. Retrieved October 31, 2022, from https://apps.who.int/gho/data/node.main.WSHOPENDEFECATION?lang=en

#7
World Health Organization. (n.d.). Gho | by category | number of reported cases - data by country. World Health Organization. Retrieved October 31, 2022, from https://apps.who.int/gho/data/node.main.175?lang=en

#8
World Health Organization. (n.d.). Gho | by category | rate of deaths by country - diarrhoeal diseases. World Health Organization. Retrieved October 31, 2022, from https://apps.who.int/gho/data/view.main.ghe2002015-CH3?lang=en

#9
Poverty Rate by Country 2022. Poverty rate by country 2022. (n.d.). Retrieved October 31, 2022, from https://worldpopulationreview.com/country-rankings/poverty-rate-by-country

#10
Population, total. Data Last Updated 9/16/2022. Retrieved November 14, 2022, from https://data.worldbank.org/indicator/SP.POP.TOTL
### Appendix A: Questions
N/A
