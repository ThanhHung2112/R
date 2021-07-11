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
# order factor levels by men's income (plot_ly() will pick up on this ordering)
data$Province_state <- factor(data$Province_state, levels = data$Province_state[order(data$D01_1)])

library(plotly)
fig <- plot_ly(data, color = I("gray80"))

fig <- fig %>% add_segments(x = ~D01_1, xend = ~D08_1, y = ~Province_state, yend = ~Province_state, showlegend = FALSE)
fig <- fig %>% add_segments(x = ~D08_1, xend = ~D15_1, y = ~Province_state, yend = ~Province_state, showlegend = FALSE)
fig <- fig %>% add_segments(x = ~D15_1, xend = ~D22_1, y = ~Province_state, yend = ~Province_state, showlegend = FALSE)
fig <- fig %>% add_segments(x = ~D22_1, xend = ~D29_1, y = ~Province_state, yend = ~Province_state, showlegend = FALSE)


fig <- fig %>% add_markers(x = ~D01_1, y = ~Province_state, name = "Day 01_1", color = I("pink"))
fig <- fig %>% add_markers(x = ~D08_1, y = ~Province_state, name = "Day 08_1", color = I("blue"))
fig <- fig %>% add_markers(x = ~D15_1, y = ~Province_state, name = "Day 15_1", color = I("red"))
fig <- fig %>% add_markers(x = ~D22_1, y = ~Province_state, name = "Day 22_1", color = I("cyan"))
fig <- fig %>% add_markers(x = ~D29_1, y = ~Province_state, name = "Day 29_1", color = I("gray"))
fig <- fig %>% layout(
  title = "Increase Deaths after 7 day of Province_State ",
  xaxis = list(title = "Count (in thousands)"),
  margin = list(l = 65)
)

fig

'
Bi???u d??? th??? hi???n s??? gia tang lu???ng ngu???i ch???t do d???ch b???nh ??? các bang c???a m???
Sau 7 ngu???i l???i so s??? lu???ng ngu???i ch???t tang lên 1 l???n
Nh???ng bang có du???ng càng dài , các ch???m cách xa nhau ch???ng t??? có s??? gia tang m???nh v??? s??? ngu???i ch???t
Nh???ng bang có các ch???m ch???ng lên nhau ch???ng t??? không có s??? gia tang v??? s??? ngu???i ch???t
S??? khác bi???t gi???a các do???n th???ng trên 1 bang th??? hi???n ti???n d??? hòng ch???ng t???t hay chua t???t ??? các bang
'
