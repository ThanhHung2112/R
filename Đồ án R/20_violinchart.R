library(hrbrthemes)
library(viridis)
library(ggplot2)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
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

us <- covid19 %>%
  filter(country_region == "US")
us <- us[c('country_region','new_cases_n')]

bra<-covid19 %>% filter(country_region == "Brazil")
bra <-bra[c('country_region','new_cases_n')]

Cana <- covid19 %>% filter(country_region =="Cambodia")
Cana <- Cana[c('country_region','new_cases_n')]
vio<-rbind(us ,bra)

vio %>%
  ggplot( aes(x=country_region, y=new_cases_n, fill=country_region)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")

