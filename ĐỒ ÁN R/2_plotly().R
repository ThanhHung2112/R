url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
df <- read.csv(url, header = TRUE)

#install.packages("plotly")
#Summarize
str(df)
library(dplyr)
library(ggcharts)
library(plotly)


fig <- plot_ly(df, x = ~Province_State, y = ~Active  , type = 'bar', name = 'Active', marker = list(color = "pink"))
fig <- fig %>% add_trace(y = ~Recovered, name = 'Recovered', marker = list(color = "cyan"))
fig <- fig %>% add_trace(y = ~Deaths, name = 'Deaths', marker = list(color = "red"))

fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')

fig


