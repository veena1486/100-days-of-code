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

## Day 1- 27 April, 2020
**(a) Today's Progress:**
Fixing errors in the variables.

**(b) Thoughts/Insights:**
Using case_when function from dplyr package which makes it very convenient to run multiple if_else statements.

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

## Day 10- 18 May, 2020
**(a) Today's Progress:**
Learned how to create heatmaps in ggplot as well as learned to create interactive time-series plot using plotly. 

**(b) Thoughts/Insights:**
It was quite exhilarating experience to finally be able to create an interactive plot. However, still need to learn to format the graph a little better for publication purpose.

## Day 11- 19 May, 2020
**(a) Today's Progress:**
Struggling with adding labels to the time series plot. I am trying to use the ggrepel package to label the trendlines for each country. However, it's not providing the result as expected. So, exploration continues!!

**(b) Thoughts/Insights:**
Certain codes work beautifully and immediately while some make you weep. Currently, I am struggling with the seemingly most simple package. I must be missing something.

## Day 12- 01 June, 2020
**(a) Today's Progress:**
Today completed creating a final dataset for continuing with my Data Science Project. Data Cleaning is one major task. It took up so much of my time to just get the data in an understandable format. I think real world data would be more messier that this. The Kaggle COVID dataset has surely given me the much needed exercise on data cleaning.

**(b) Thoughts/Insights:**
It is so very true!! Data Science is not just all about algorithms. Without clean dataset, your algorithms will not be of any help and cleaning the data is one hell of an exercise. Phew!!! Glad to be done with it for now!!! Next stop- Exploration and Visualization.

## Day 13- 02 June, 2020
**(a) Today's Progress:**
Finally! Started working on the exploratory data analysis(EDA) pipeline using GGally and skimr packages.
**(b) Thoughts/Insights:**
This is very neat. In just two lines of code, I am able to explore the data based on data types and also get an descriptive summary of my features.

## Day 14- 05 June, 2020
**(a) Today's Progress:**
Today I worked creating feature visualization using GGally and also worked on building the data processing pipeline using functional programming in R.

**(b) Thoughts/Insights:**
I realise that my progress is pretty slow!! A snail would overtake me!! But that's OK. My foundations are getting built and its better to invest more time on building the foundations than rushing through to just build a project and not understanding the results at all.

## (I) Data Wrangling & Manipulation
## Day 15- 09 June, 2020
**(a) Today's Progress:**
Went back to the Data Wrangling process to create a structured pipeline for data wrangling. Otherwise, my code was becoming too long, repetitive and confusing.

**(b) Thoughts/Insights:**
Finally, understood how to do functional programming in R. It makes the entire process so much easier as I don't have repeat the same process whenever new data comes in. Now, just need to figure out same in Python.

## (III) Data Understanding
## Day 16- 26 June, 2020
**(a) Today's Progress:**
I know it's been a long break from working on my project. But after a lot of back & forth of learning, I have finally started with the pre-processing of my data. Initially, I planned to use the recipes package to pre-process my data but I felt that I first need to do each step manually so that I can understand the process entirely. 

**(b) Thoughts/Insights:**
So, I finally learned how to impute for missing values in my data as well as understood the difference between label encoding and one hot encoding.

## Day 17- 06 July, 2020
**(a) Today's Progress:**
So I have been working intermittently on my project and have been unable to give it the dedication with which I had started off. But today, I decided to sit for few hours and work on my code. So, today I learned how to prepare my data prior to using machine learning models. I worked on cleaning the missing data and performed data transformations as well as one hot encoding to create dummy features. 

**(b) Thoughts/Insights:**
Using the processed data, I performed correlation analysis to identify the most relevant features.


