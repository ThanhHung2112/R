library(tidyverse)
library(lubridate)

theme_set(theme_minimal())
#remove x in date
url = 'https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv'
covid19_raw <- read_csv(url)
#get 200 day 
covid19_raw <- covid19_raw[,1:200]
# start code plot
covid19 <- covid19_raw %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "confirmed_n") %>%
  
  select(-c(Lat, Long)) %>%
  
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`) %>%
  
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(confirmed_n = sum(confirmed_n)) %>%
  ungroup()

covid19 <- covid19 %>%
  arrange(date) %>%
  group_by(country_region) %>%
  mutate(new_cases_n = confirmed_n - lag(confirmed_n, default = 0)) %>%
  ungroup()


covid19 %>%
  filter(country_region == "US") %>%
  ggplot(aes(x = date, y = new_cases_n)) +
  geom_line() +
  scale_x_date(date_breaks = "2 weeks", date_labels = "%d %b") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    x = "Date", y = "New cases",
    title = "New confirmed COVID-19 cases in the United States")


covid19 %>%
  filter(country_region %in% c("US", "Australia")) %>%
  ggplot(aes(x = date, y = new_cases_n, color = country_region)) +
  geom_line(show.legend = FALSE) +
  scale_x_date(date_breaks = "2 weeks", date_labels = "%d %b") +
  scale_y_continuous(labels = scales::comma) +
  facet_wrap(~country_region, ncol = 1, scales = "free_y") +
  #set date
  labs(x = "Date", y = "New cases",
    title = "New confirmed COVID-19 cases in Australia & United States")
  