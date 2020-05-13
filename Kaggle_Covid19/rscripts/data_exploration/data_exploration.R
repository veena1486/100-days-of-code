
library(tidyquant)
library(tidyverse)
library(dplyr)
library(tidyr)
library(forcats)
library(scales)

# 1.0 Exploratory Data Analysis ----
# 1.1 Global Covid 19 Cases Dataset ----
# (I) Problem Question 
# (a) What is the infection rate by country?
# (b) What is the magnitude of deaths by country?
# (c) What is the recovery rate by country?

global_c19_merged_tbl <- read_rds("00_Data/03_data_clean/merged_global_cases.rds")
world_population_tbl <- read_rds("00_Data/02_data_wrangled/world_population.rds")

#glimpse(global_c19_merged_tbl)
global_c19_merged_tbl <- global_c19_merged_tbl %>%
  rename(reported_date = Date) %>%
  mutate(reported_date = as.POSIXct(reported_date)) %>%
  mutate(reported_date = dmy(reported_date))


# (I) Problem Question A: What is the infection rate by country? ----
# (A) Data Variables Summary
global_c19_merged_tbl %>%
  select(country, Date, total_confirmed) %>%
  summary()
  
# (B) Univariate Analysis
# Aggregating by Time using Lubridate package
# (1) Global Daily Trend in Confirmed Cases of COVID 19
daily_confirmed_cases <- global_c19_merged_tbl %>%
  select(reported_date, total_confirmed) %>%
  
  #Group & Summarize by date
  group_by(reported_date) %>%
  summarise(confirmed_cases = sum(total_confirmed)) %>%
  ungroup() 

#Plot
daily_confirmed_cases %>%
  ggplot(aes(reported_date, confirmed_cases))+
  geom_point()+
  
  #Formatting
  scale_x_date(NULL,
               breaks = scales::breaks_width("5 days"),
               labels = scales::label_date_short()) +
  scale_y_continuous("Global- Total confirmed cases",
                     labels = scales::label_number_si())+
  labs(title = "Daily Trends",
       subtitle ="Total Confirmed Cases of Covid-19",
       caption = "Global rising trends in the daily counts of confirmed cases of Covid 19")+
  theme_tq()

# (2) Global Daily Trend in Death Cases due to COVID 19
daily_death_cases <- global_c19_merged_tbl %>%
  select(Date, total_death) %>%
  
  #Group & Summarize by date
  group_by(reported_date) %>%
  summarise(death_cases = sum(total_death)) %>%
  ungroup()

#Plot
daily_death_cases %>% 
  ggplot(aes(reported_date, death_cases))+
  geom_point()+
  
  #Formatting
  scale_x_date(NULL,
               breaks = scales::breaks_width("5 days"),
               labels = scales::label_date_short()) +
  scale_y_continuous("Global- Total deaths",
                     labels = scales::label_number_si())+
  labs(title = "Daily Trends",
       subtitle ="Total Deaths due to Covid-19",
       caption = "Global rising trends in the daily counts of deaths caused by Covid 19")+
  theme_tq()
 
# (3) Global Daily Trend of Recovered Cases
daily_recovery_cases <- global_c19_merged_tbl %>%
  select(Date, total_recovered) %>%
  
  #Group & Summarize by date
  group_by(reported_date) %>%
  summarise(recovered_cases = sum(total_recovered)) %>%
  ungroup()
  
#Plot
daily_recovery_cases %>%
  ggplot(aes(reported_date, recovered_cases))+
  geom_point()+
  
  #Formatting
  scale_x_date(NULL,
               breaks = scales::breaks_width("5 days"),
               labels = scales::label_date_short()) +
  scale_y_continuous("Global- Recovered Cases",
                     labels = scales::label_number_si())+
  labs(title = "Daily Trends",
       subtitle ="Confirmed Cases that have Recovered",
       caption = "Daily trend in the recovery of COVID 19 Confirmed Cases")+
  theme_tq()


# # Aggregating by Country using Forcats package
n <- 10

#(1) Total Confirmed Cases by Country
country_confirmed_cases_tbl <- global_c19_merged_tbl %>%
  select(country, total_confirmed) %>%
  
  #Convert Country Variable to a Factor from Character Type
  mutate(country = as_factor(country) %>% fct_lump(n = n, w = total_confirmed)) %>%
  
  #Group & Summarize
  group_by(country) %>%
  summarise(confirmed_cases = sum(total_confirmed)) %>%
  ungroup() %>%
  mutate(country = country %>% fct_reorder(confirmed_cases)) %>%
  mutate(country = country %>% fct_relevel("Other", after = 0)) %>%
  arrange(desc(country)) %>%
  
  #Case Labels
  mutate(confirmed_label = number(confirmed_cases, accuracy = 0.01, scale = 1e-6, suffix = "M")) %>%
  
  # Cummulative Percent
  # mutate(cumpct = cumsum(confirmed_cases)/sum(confirmed_cases)) %>%
  # mutate(cumpct_text = scales::percent(cumpct)) %>%
  
  #Rank
  mutate(rank = row_number()) %>%
  mutate(rank = case_when(
    rank == max(rank) ~ NA_integer_,
    TRUE ~ rank
  )) %>%
  
  #Label Text
  mutate(label_text = str_glue("Rank:{rank}\n Cases:{confirmed_label}")) 

#Plot
country_confirmed_cases_tbl %>%
  ggplot(aes(confirmed_cases, country)) +
  geom_segment(aes(xend = 0, yend = country), 
               color = palette_light()[2],
               size = 1)+
  geom_point(aes(size = confirmed_cases),
             color = palette_light()[2]) +
  geom_label(aes(label = label_text), 
             hjust = "inward",
             size = 2.9,
             color = palette_light()[1]) +
  
  #Formatting
  scale_x_continuous(labels = scales::label_number_si()) +
  labs(title = str_glue("Top {n} Countries- Highest Number of Confirmed Cases"),
  subtitle = str_glue("From: {min(global_c19_merged_tbl$reported_date)}
                      To: {max(global_c19_merged_tbl$reported_date)}"),
  x = "Confirmed Cases (in millions)",
  y = "Country") + 
  theme_tq()


#(2) Total Deaths by Country
country_death_cases_tbl <- global_c19_merged_tbl %>%
  select(country, total_death) %>%
  
  #Convert Country Variable to a Factor from Character Type
  mutate(country = as_factor(country) %>% fct_lump(n = n, w = total_death)) %>%
  
  #Group & Summarize
  group_by(country) %>%
  summarise(death_cases = sum(total_death)) %>%
  ungroup() %>%
  mutate(country = country %>% fct_reorder(death_cases)) %>%
  mutate(country = country %>% fct_relevel("Other", after = 0)) %>%
  arrange(desc(country)) %>%
  
  #Case Labels
  mutate(death_label = number(death_cases, accuracy = 0.01, scale = 1e-6, suffix = "M")) %>%
  
  # Cummulative Percent
  # mutate(cumpct = cumsum(confirmed_cases)/sum(confirmed_cases)) %>%
  # mutate(cumpct_text = scales::percent(cumpct)) %>%
  
  #Rank
  mutate(rank = row_number()) %>%
  mutate(rank = case_when(
    rank == max(rank) ~ NA_integer_,
    TRUE ~ rank
  )) %>%
  
  #Label Text
  mutate(label_text = str_glue("Rank:{rank}\n Cases:{death_label}")) 

#Plot
country_death_cases_tbl %>%
  ggplot(aes(death_cases, country)) +
  geom_segment(aes(xend = 0, yend = country), 
               color = palette_light()[2],
               size = 1)+
  geom_point(aes(size = death_cases),
             color = palette_light()[2]) +
  geom_label(aes(label = label_text), 
             hjust = "inward",
             size = 2.9,
             color = palette_light()[1]) +
  
  #Formatting
  scale_x_continuous(labels = scales::label_number_si()) +
  labs(title = str_glue("Top {n} Countries- Highest Number of Deaths"),
       subtitle = str_glue("From: {min(global_c19_merged_tbl$reported_date)}
                      To: {max(global_c19_merged_tbl$reported_date)}"),
       x = "Total Deaths (in millions)",
       y = "Country") + 
  theme_tq()


#(3) Total Recovered Cases by Country
country_recovered_cases_tbl <- global_c19_merged_tbl %>%
  select(country, total_recovered) %>%
  
  #Convert Country Variable to a Factor from Character Type
  mutate(country = as_factor(country) %>% fct_lump(n = n, w = total_recovered)) %>%
  
  #Group & Summarize
  group_by(country) %>%
  summarise(recovered_cases = sum(total_recovered)) %>%
  ungroup() %>%
  mutate(country = country %>% fct_reorder(recovered_cases)) %>%
  mutate(country = country %>% fct_relevel("Other", after = 0)) %>%
  arrange(desc(country)) %>%
  
  #Case Labels
  mutate(death_label = number(recovered_cases, accuracy = 0.01, scale = 1e-6, suffix = "M")) %>%
  
  # Cummulative Percent
  # mutate(cumpct = cumsum(confirmed_cases)/sum(confirmed_cases)) %>%
  # mutate(cumpct_text = scales::percent(cumpct)) %>%
  
  #Rank
  mutate(rank = row_number()) %>%
  mutate(rank = case_when(
    rank == max(rank) ~ NA_integer_,
    TRUE ~ rank
  )) %>%
  
  #Label Text
  mutate(label_text = str_glue("Rank:{rank}\n Cases:{death_label}")) 

#Plot
country_recovered_cases_tbl %>%
  ggplot(aes(recovered_cases, country)) +
  geom_segment(aes(xend = 0, yend = country), 
               color = palette_light()[2],
               size = 1)+
  geom_point(aes(size = recovered_cases),
             color = palette_light()[2]) +
  geom_label(aes(label = label_text), 
             hjust = "inward",
             size = 2.9,
             color = palette_light()[1]) +
  
  #Formatting
  scale_x_continuous(labels = scales::label_number_si()) +
  labs(title = str_glue("Top {n} Countries- Highest Number of Recovered Cases"),
       subtitle = str_glue("From: {min(global_c19_merged_tbl$reported_date)}
                      To: {max(global_c19_merged_tbl$reported_date)}"),
       x = "Total Recovered Cases (in millions)",
       y = "Country") + 
  theme_tq()



 
  


  