setwd("C:\\Users\\Admin\\Downloads")

A = read.csv('Temperature.csv', header = TRUE)
mean1 = tapply(A$Temperature, A$Month, mean, na.rm =TRUE)
mean1
mean2 = tapply(A$Temperature, list(A$Year, A$Month), mean, na.rm =TRUE)
mean2
mean3 = tapply(A$Temperature, A$Month, sd, na.rm =TRUE)
mean3
help(table)
 
table(A$Year)
table(A$Station,A$Year)