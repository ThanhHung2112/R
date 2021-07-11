library(dplyr)
library(ggplot2)
library(plotly)

url='https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/07-07-2021.csv'
df1 <- read.csv(url, header=TRUE)
df1<-df1[-c(3,10,11,14,15,40,45,53),]
df1$hover <- with(df1, paste(Province_State, '<br>',
                             "Confirmed", Confirmed,
                             "Deaths", Deaths, "<br>",
                             "Total Test results", Total_Test_Results))
#Statecode:
code <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_us_ag_exports.csv")
code <- code[c(1)]
df1 <- cbind(df1,code)

# give state boundaries a white border
l <- list(color = toRGB("white"), width = 2)

# specify some map projection/options
g <- list(  scope = 'usa',
            projection = list(type = 'albers usa'),
            showlakes = TRUE,
            lakecolor = toRGB('white')
)
fig <- plot_geo(df1, locationmode = 'USA-states')
fig <- fig %>% add_trace(
  z = ~Confirmed, text = ~hover, locations = ~code,
  color = ~Confirmed, colors = 'magma')

fig <- fig %>% colorbar(title = "Confirmed")
fig <- fig %>% layout(
  title = 'Covid19- US by State<br>(Confirmed)',
  geo = g)

fig
