# 100 Days of Data Science- Log
#### *data exploration, machine learning, spatial analytics, deep learning*
**(a) Data:** Kaggle Challenge: ROCHE DATA SCIENCE COALITION- Uncover COVID-19

**(b) Coding Plan:** 

(1) Data Wrangling:
Tidying up the dataset with
- Missing Values Treatment
- Treatment of wrong entries
- Changing data types

(2) Data Exploration:
Exploring the data provided under Roche Data Science Coalition- Uncover COVID-19.
The plan is to explore the data using EDA methods and understand the data. 
Coding tasks to be performed:
- Univariate Analysis
- Bivariate Analysis
- Outlier Treatment
- Variable Transformation
- New Variable Creation

# Data Science Workflow
## (I) Data Wrangling & Manipulation
## Day 0- 26 April, 2020
**(a) Today's Progress:**
Started with taking a look into the dataset. Prepared a data cleaning pipeline.

**(b) Thoughts/Insights:**
Preliminary look into the data indicates few tidying up of values and dropping of unwanted features.

**(c) Link to code:** [Data Cleaning Report](https://rpubs.com/veena_mu/report)

## Day 1- 27 April, 2020
**(a) Today's Progress:**
Fixing errors in the variables.

**(b) Thoughts/Insights:**
Using case_when function from dplyr package which makes it very convenient to run multiple if_else statements.

**(c) Link to code:** [Data Cleaning Report](https://rpubs.com/veena_mu/report)

## Day 2- 28 April, 2020
**(a) Today's Progress:**
Merged the clean dataset into a semi-refined dataset for further data exploration and feature selection/transformation.

**(b) Thoughts/Insights:**
Learned how to merge multiple datasets by multiple parameters using the join function in R. 

## Day 3- 29 April, 2020
**(a) Today's Progress:**
Scrapped the merged file as the data seemed too complex to derive any insights. Started focusingon the COVID cases reported by WHO. Tried to fix the missing data values. 

**(b) Thoughts/Insights:**
Realised that I would need to first anaylse the datasets in silo and derive valuable features and then join those features to create a better dataset for the model.

## Day 4- 30 April, 2020
**(a) Today's Progress:**
Used replace_na to replace the missing values. Decided to deconstruct the task 1 question into multiple questions so as to build a valuable dataset. Focussed on identifying the trends in covid cases by date and country. 

**(b) Thoughts/Insights:**
Realised the importance of zoning on the problem question and deconstruct it into simpler queries so as to understand the data thoroughly.

## Day 5- 01 May, 2020
**(a) Today's Progress:**
Was able to create a web scraping code to extract population data. 

**(b) Thoughts/Insights:**
Learned how to scrape valuable information from the web. However, this was a very basic code and need to look into more scaleable version.

## Day 06- 04 May, 2020
**(a) Today's Progress:**
Getting stuck in visualizing the data. The data seems to have some false values.

**(b) Thoughts/Insights:**
Back to cleaning the data. Trying to learn replace function of R.

## Day 07- 11 May, 2020
**(a) Today's Progress:**
Started working on the challenge after a few days break as I was not getting any further with the data I had. I realised that the data was incorrect and was spending too much time cleaning the wrong dataset. Learning alert: Need to always verify the data properly before investing so much time on data cleaning. As the data had wrong information, I was getting stuck in my visualization. However, after verifying the data now I am able to properly explore and gain right insights into my data. Now, I am able to use the lubridate and forcats package properly to create valuable plots for my data exploration.

**(b) Thoughts/Insights:**
Always spend time initially to verify the data source and its validity as it may throw you off entirely from your analysis.

## (II) Data Exploration
## Day 08- 12 May, 2020
**(a) Today's Progress:**
After manipulating the data, I started exploring the COVID-19 cases globally. Learned how to use ggplot in R to visualize the core data in terms of the daily trends in confirmed cases, deaths due to the pandemic as well as the trend in recovery cases.

**(b) Thoughts/Insights:**
It is alarming to see the increasing daily trends but there seem to be silver lining as the trend is similar in case of the daily recoveries as well. 

## Day 09- 13 May, 2020
**(a) Today's Progress:**
Performed univariate analysis. Initially created histograms to view the distibution of the data for each variable- total confirmed cases, total death & total recovered cases. The data shows skewed distribution. 

**(b) Thoughts/Insights:**
Need to check the distribution further. 

## Day 09- 14 May, 2020
**(a) Today's Progress:**
Performed bivariate analysis. Created boxplots to detect the outliers. Created boxplots region wise and country wise.  

**(b) Thoughts/Insights:**
None.

