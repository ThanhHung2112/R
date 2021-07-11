url1 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
url2 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-08-2021.csv'
url3 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-15-2021.csv'
url4 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-22-2021.csv'
url5 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-29-2021.csv'
# read csv from url
df1 = read.csv(url1)
df2 = read.csv(url2)
df3 = read.csv(url3)
df4 = read.csv(url4)
df5 = read.csv(url5)

Province_state = df1[1:20,'Province_State']
D01_1 = df1[1:20,'Deaths']
D08_1 = df2[1:20,'Deaths']
D15_1 = df3[1:20,'Deaths']
D22_1 = df4[1:20,'Deaths']
D29_1 = df5[1:20,'Deaths']


data1 = data.frame(Province_state,D01_1) 
data2 = data.frame(Province_state,D08_1) 
data3 = data.frame(Province_state,D15_1) 
data4 = data.frame(Province_state,D22_1)
data5 = data.frame(Province_state,D29_1)

names(data1) <- c('Province_state', 'Deaths' )
names(data2) <- c('Province_state', 'Deaths' )
names(data3) <- c('Province_state', 'Deaths' )
names(data4) <- c('Province_state', 'Deaths' )
names(data5) <- c('Province_state', 'Deaths' )

data1 <- rbind(data1, data2)
data1 <- rbind(data1, data3)
data1 <- rbind(data1, data4)
data1 <- rbind(data1, data5)

library(hrbrthemes)
library(ggplot2)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
library(viridis)
data1 %>%
  ggplot( aes(x=Province_state, y=Deaths, fill=Province_state)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Basic boxplot") +
  xlab("Province_state")

# Violin basic
data1 %>%
  ggplot( aes(x=Province_state, y=Deaths, fill=Province_state)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
    ) +
    ggtitle("Violin chart") +
    xlab("")

