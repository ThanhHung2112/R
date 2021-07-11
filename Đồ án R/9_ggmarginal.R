url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv'
df <- read.csv(url, header = TRUE)
df <- df[1:15,]

# load package and data
library(ggplot2)
library(ggExtra)
#install.packages("ggExtra")

# Scatterplot
theme_set(theme_bw())  # pre-set the bw theme.
mpg_select <- df[df$Confirmed >= 3500 & df$Active > 2100, ]
g <- ggplot(df, aes(Active, Confirmed)) + 
  geom_count() + 
  geom_smooth(method="lm", se=F)

ggMarginal(g, type = "histogram", fill="transparent")
ggMarginal(g, type = "boxplot", fill="transparent")
# ggMarginal(g, type = "density", fill="transparent")