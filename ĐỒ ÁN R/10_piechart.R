url = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
covid <- read.csv(url)
covid[is.na(covid)] <- 0
slice <- covid[, c(1, 6, 7, 8, 9)]
total <- colSums(slice[,-1])
total <- data.frame(total)
total <- cbind(rownames(total), total)
rownames(total) <- 1:nrow(total)
colnames(total) <- c("Var", "Count")

data <- total[2:4,]


colors <- c('rgb(144,103,167)',
            'rgb(171,104,87)',
            'rgb(114,147,203)')

p11 <- data %>%
  plot_ly(labels = ~ Var, values = ~ Count, type = 'pie',
          textposition = 'inside',
          textinfo = 'label+percent',
          insidetextfont = list(color = '#FFFFFF'),
          hoverinfo = 'text',
          text = ~paste(Count, 'human'),
          marker = list(colors = colors,
                        line = list(color = '#999999', width = 2)),
          showlegend = TRUE)

p11 <- p11 %>% 
  layout(title = 'COVID 19',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

ggplotly(p11)
