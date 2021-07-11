library(ggplot2)

url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/01-01-2021.csv'
df <- read.csv(url, header = TRUE)
# create dummy data



# Most basic error bar

df <- df[50:65,]
ggplot(df) + 
  geom_bar( aes(x= Province_State, y= Active), stat="identity", fill="skyblue", alpha=0.7) +
  geom_errorbar( aes(x=Province_State, ymin=  Deaths, ymax= Active + Deaths), width=0.4, colour="orange", alpha=0.9, size=1.3)

