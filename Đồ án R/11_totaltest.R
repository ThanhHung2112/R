url = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
covid <- read.csv(url)

library(hrbrthemes)
library(viridis)
library(plotly)
#help(theme_ipsum)

fig <- covid %>%
  ggplot( aes(x=Province_State, y=Total_Test_Results,
              size = Total_Test_Results, color = Province_State)) +
  #fit size
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19)) +
  scale_color_viridis(discrete=TRUE) +
  theme_ipsum() +
  # legend _ labs
  theme(legend.position="bottom") +
  labs(x = "Province", y = "Total Test Results",
       title = "Total Test Result in US") + 
  # add_animat
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14),
        plot.title = element_text(hjust = 0.5, size = 18),
        panel.background = element_rect(fill = "gray"),
        panel.border = element_rect(colour = '#990000', fill = NA, size = 1.5))

ggplotly(fig, dynamicTicks = TRUE)

