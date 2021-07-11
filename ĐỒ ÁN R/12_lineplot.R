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

library(ggplot2)
# Basic line plot with points
ggplot(data, aes(x=Province_state, y=D01_1, group=1)) +
  geom_line()+
  geom_point()
# Change the line type
ggplot(data, aes(x=Province_state, y =D08_1, group=1)) +
  geom_line(linetype = "dashed")+
  geom_point()
# Change the color
ggplot(data, aes(x=Province_state, y=D15_1, group=1)) +
  geom_line(color="red")+
  geom_point()
