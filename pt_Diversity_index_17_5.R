setwd("C:\\Users\\Admin\\Downloads")

Vegetation2 <- read.table("Vegetation2.txt", header = TRUE)
names(Vegetation2)
str(Vegetation2)

# l???y các di???m t??? 6 --> 9
Veg2 = Vegetation2[,6:9]

# Dùng hàm d??? nh???p table và choice
Index.function <-function(Veg2, Choice){
  # S??? khu v???c xu???t hi???n loài
  if (Choice=="Richness") {
    Index <- rowSums(Veg2>0, na.rm = TRUE)
  }
  # tinh tong so ca the cua 1 loai
  if (Choice=="Total Abundance") {
    Index <- rowSums(Veg2, na.rm = TRUE)
  }
  # tinh chi so da dang loai
  if (Choice=="Shannon") {
    RS <- rowSums(Veg2, na.rm=TRUE)
    prop <- Veg2 / RS
    Index <- -rowSums(prop * log10(prop), na.rm= TRUE)
  }
  list(Index=Index, MyChoice= Choice)
}

Index.function(Veg2,"Richness")
Index.function(Veg2,"Total Abundance")
Index.function(Veg2,"Shannon")
