url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
df <- read.csv(url, header = TRUE)

# install.packages("ggcharts")
#Summarize
str(df)
library(dplyr)
library(ggcharts)
library(plotly)


f <- plot_ly(df %>% 
               top_n(15, Deaths),  x = ~Confirmed, y = ~Province_State, type = 'bar',
             text = ~Confirmed, textposition =  'auto',
                            marker = list(color = 'rgb(158,202,225)',
                             line = list(color = 'rgb(8,48,107)', width = 1))) 

f <- f  %>% layout(title = "Confirmed in Province_State")

f 




