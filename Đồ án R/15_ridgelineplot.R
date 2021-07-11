url1 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
url2 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-08-2021.csv'
url3 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-15-2021.csv'
url4 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-22-2021.csv'
url5 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-29-2021.csv'
url6 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-05-2021.csv'
url7 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-09-2021.csv'
url8 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-18-2021.csv'
url9 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-24-2021.csv'
url10 = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-26-2021.csv'
# read csv from url
df1 = read.csv(url1)
df2 = read.csv(url2)
df3 = read.csv(url3)
df4 = read.csv(url4)
df5 = read.csv(url5)
df6 = read.csv(url6)
df7 = read.csv(url7)
df8 = read.csv(url8)
df9 = read.csv(url9)
df10 = read.csv(url10)

Province_state = df1[1:20,'Province_State']
D1 = df1[1:20,'Active']
D2 = df2[1:20,'Active']
D3 = df3[1:20,'Active']
D4 = df4[1:20,'Active']
D5 = df5[1:20,'Active']
D6 = df6[1:20,'Active']
D7 = df7[1:20,'Active']
D8 = df8[1:20,'Active']
D9 = df9[1:20,'Active']
D10 = df10[1:20,'Active']

data1 = data.frame(Province_state,D1) 
data2 = data.frame(Province_state,D2) 
data3 = data.frame(Province_state,D3) 
data4 = data.frame(Province_state,D4)
data5 = data.frame(Province_state,D5)
data6 = data.frame(Province_state,D6) 
data7 = data.frame(Province_state,D7) 
data8 = data.frame(Province_state,D8) 
data9 = data.frame(Province_state,D9)
data10 = data.frame(Province_state,D10)

names(data1) <- c('Province_state', 'Active' )
names(data2) <- c('Province_state', 'Active' )
names(data3) <- c('Province_state', 'Active' )
names(data4) <- c('Province_state', 'Active' )
names(data5) <- c('Province_state', 'Active' )
names(data6) <- c('Province_state', 'Active' )
names(data7) <- c('Province_state', 'Active' )
names(data8) <- c('Province_state', 'Active' )
names(data9) <- c('Province_state', 'Active' )
names(data10) <- c('Province_state', 'Active' )

data1 <- rbind(data1, data2)
data1 <- rbind(data1, data3)
data1 <- rbind(data1, data4)
data1 <- rbind(data1, data5)
data1 <- rbind(data1, data6)
data1 <- rbind(data1, data7)
data1 <- rbind(data1, data8)
data1 <- rbind(data1, data9)
data1 <- rbind(data1, data10)

#install.packages("ggridges")
library(ggridges)
library(ggplot2)

# Diamonds dataset is provided by R natively
#head(diamonds)

# basic example
ggplot(data1, aes(x = Active, y = Province_state, fill = Province_state)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")

