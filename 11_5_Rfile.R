setwd("C:\\Users\\Admin\\Downloads")

Owls = read.table('Owls.txt', header= TRUE, dec ='.')
names(Owls)
str(Owls)

Owls$FoodTreatment
Owls
Owls$FoodTreatment == 'Satiated'

# N???u FoodTreatment là 'Satiated' thì ch???n tên là 'Nest_1'
# Ngu???c l???i thì ch???n tên là 'Nest_2'
Owls$NestNight = ifelse(Owls$FoodTreatment == 'Satiated', 
                        Owls$NestNight <- paste(Owls$Nest,'1',sep = '_'),
                        Owls$NestNight <- paste(Owls$Nest,'2',sep = '_'))

as.character(AllNestsNights[1])
Owls   
AllNestsNights <- unique(Owls$NestNight)
N <- length(AllNestsNights)

# V??? bi???u d???, nhung khóa l???i không cho nó v???
for (i in 1:N){
  NestNight.i <- as.character(AllNestsNights[i])
  print(NestNight.i)
  Owlsi <- Owls[Owls$NestNight==NestNight.i,]
  FileName <- paste(NestNight.i,'.jpg', sep='')
  #jpeg(file = FileName)
  plot(x = Owlsi$ArrivalTime, y= Owlsi$NegPerChick,
       xlab = 'Arrival Time',
       ylab = 'Sibling negotiation',
       main = NestNight.i)
  #off
}