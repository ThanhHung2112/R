url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
df <- read.csv(url, header = TRUE)


library(plotly)



fig <- plot_ly(df %>%
                 top_n(20, Confirmed), x = ~Province_state, y = ~Active, type = 'bar', name = 'Active')
fig <- fig %>% add_trace(y = ~Recovered, name = 'Recovered')
fig <- fig %>% add_trace(y = ~Deaths, name = 'Deaths')
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'group')

fig
