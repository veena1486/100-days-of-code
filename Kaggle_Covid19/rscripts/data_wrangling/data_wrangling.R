# 1.0 Load library----
library(dplyr)
library(tidyverse)
library(lubridate)

# 2.0 Load Dataset----
# 2.1 Global Covid 19 Confirmed Cases dataset----
global_c19_confirmed_tbl <- read_rds("00_Data/02_data_wrangled/global_c19_confirmed.rds")
#glimpse(global_c19_confirmed_tbl)

# (A) Data Cleaning----
global_c19_confirmed_cleaned_tbl <- global_c19_confirmed_tbl %>%
  ## Identifying & Removing duplicates
  unique() %>% 
  
  #Group & Summarize data
  group_by(country, Date, Lat, Long) %>%
  summarise(confirmed_cases = sum(confirmed)) %>%
  ungroup()

# (B) Create new dataset ----
confirmed_cases <- global_c19_confirmed_cleaned_tbl %>%
  select(country, Date, confirmed_cases) %>%
  
  #Group & Summarize cases by country and date
  group_by(country, Date) %>%
  summarise(total_confirmed = sum(confirmed_cases)) %>%
  ungroup()

# 2.2 Global Covid 19 Death Cases dataset----
global_c19_death_tbl <- read_rds("00_Data/02_data_wrangled/global_c19_deaths.rds")
#glimpse(global_c19_death_tbl)

# (A) Data Cleaning----
global_c19_death_cleaned_tbl <- global_c19_death_tbl %>%
  ## Identifying & Removing duplicates
  unique() %>% 
  
  #Group & Summarize data
  group_by(country, Date, Lat, Long) %>%
  summarise(death_case = sum(deaths)) %>%
  ungroup()

# (B) Create new dataset ----
death_cases <- global_c19_death_cleaned_tbl %>%
  select(country, Date, death_case) %>%
  
  #Group & Summarize cases by country and date
  group_by(country, Date) %>%
  summarise(total_death = sum(death_case)) %>%
  ungroup()

# 2.3 Global Covid 19 Recovered Cases dataset----
global_c19_recovered_tbl <- read_rds("00_Data/02_data_wrangled/global_c19_recovered.rds")
#glimpse(global_c19_recovered_tbl)

# (A) Data Cleaning----
global_c19_recovered_cleaned_tbl <- global_c19_recovered_tbl %>%
  ## Identifying & Removing duplicates
  unique() %>% 
  
  #Group & Summarize data
  group_by(country, Date, Lat, Long) %>%
  summarise(recover_cases = sum(recovered)) %>%
  ungroup()

# (B) Create new dataset ----
recovered_cases <- global_c19_recovered_cleaned_tbl %>%
  select(country, Date, recover_cases) %>%
  
  #Group & Summarize cases by country and date
  group_by(country, Date) %>%
  summarise(total_recovered = sum(recover_cases)) %>%
  ungroup()

# 2.4 Global Covid 19 Cases Processed dataset----
global_c19_cases_clean_tbl <- confirmed_cases %>%
  inner_join(death_cases, by = c("country", "Date")) %>%
  inner_join(recovered_cases, by = c("country", "Date"))

# 3.0 Write Data
fs::dir_create("00_Data/03_data_clean")

global_c19_confirmed_cleaned_tbl %>%  write_rds("00_Data/03_data_clean/global_c19_confirmed_cases.rds")
global_c19_death_cleaned_tbl %>% write_rds("00_Data/03_data_clean/global_c19_death_cases.rds")
global_c19_recovered_cleaned_tbl %>% write_rds("00_Data/03_data_clean/global_c19_recovered_cases.rds")
global_c19_cases_clean_tbl %>% write_rds("00_Data/03_data_clean/merged_global_cases.rds")