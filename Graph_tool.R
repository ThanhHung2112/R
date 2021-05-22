setwd("C:\\Users\\Admin\\Downloads")

Benthic <-read.table(file="RIKZ2.txt", header=TRUE)
Bent.M <-tapply(Benthic$Richness, 
                INDEX=Benthic$Beach, 
                FUN=mean)
Bent.sd <-tapply(Benthic$Richness, 
                 INDEX=Benthic$Beach, 
                 FUN=sd)
MSD <- cbind(Bent.M, Bent.sd)
MSD
barplot(Bent.M)


bp <- barplot(Bent.M, xlab="Beach",
              ylim = c(0,20),
              ylab="Richness",
              col=rainbow(9)
)
arrows(bp, Bent.M, 
       bp, Bent.M+Bent.sd,
       lwd=1.5,
       angle=90,
       length=0.1
)
box()


Benth.le <- tapply(Benthic$Richness,
                   INDEX=Benthic$Beach,
                   FUN=length)
#se= standard error= 
#standard deviation/square root of the sample size
#
Bent.se <- Bent.sd/sqrt(Benth.le)
Bent.se
#STRIP CHART


stripchart(Benthic$Richness~Benthic$Beach,
           vert=TRUE,
           pch=1,
           method="jitter",
           jit=0.05,
           xlab="Beach",
           ylab="Richness")
points(1:9, Bent.M, pch=16,
       cex=1.5)
arrows(1:9, Bent.M,
       1:9, Bent.M+Bent.se,
       lwd=1.5,
       angle=90,
       length = 0.1)
arrows(1:9, Bent.M,
       1:9, Bent.M-Bent.se,
       lwd=1.5,
       angle=90,
       length = 0.1)