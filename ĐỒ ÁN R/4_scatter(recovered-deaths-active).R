url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
df <- read.csv(url, header = TRUE)


library(plotly)


fig <- plot_ly(df, x = ~Recovered, y = ~Province_State,
               name = "Recovered", type = 'scatter',
               mode = "markers", marker = list(color = "cyan"))
fig <- fig %>% add_trace(x = ~Deaths, y = ~Province_State, 
                         name = "Deaths",type = 'scatter',
                         mode = "markers", marker = list(color = "red"))
fig <- fig %>% add_trace(x = ~Active, y = ~Province_State,
                         name = "Active",type = 'scatter',
                         mode = "markers", marker = list(color = "yellow"))
fig <- fig %>% layout(
  title = "Recovered - Deaths - Active",
  xaxis = list(title = "Count "),
  margin = list(l = 100)
)

fig


