library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
theme_set(theme_minimal())
#ConfirmDataset
# get link
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

data = data.frame(Province_state,D01_1,D08_1,D15_1,D22_1,D29_1) 
data
data <- data[1:4,]

final_df <- t(data)
rownames(final_df) <- NULL
date = c('2021-01-01','2021-01-08','2021-01-15','2021-01-22','2021-01-29')
colnames(final_df) <- c( 'Alabama','Alaska','American Samoa','Arizona')
final_df <- final_df[2:6,]
final_df <- cbind(final_df,date)
library(plotly)
str(final_df)
final_df <- data.frame(final_df)
#Fig
fig <- plot_ly(data = final_df, x = ~date, y = ~Alabama,
               name = 'Alabama', type = 'scatter', mode = 'lines') 
fig <- fig %>% add_trace(y = ~Alaska, name = 'Alaska', mode = 'lines')
fig <- fig %>% add_trace(y = ~Arizona, name = 'Arizona', mode = 'lines')
fig
