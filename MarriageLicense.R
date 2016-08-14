library(ggplot)

marriage <- read.csv("D:\\marriage.csv")

names(marriage)[names(marriage)=="TIME_PERIOD"] <- "TimePeriod"
names(marriage)[names(marriage)=="CIVIC_CENTRE"] <- "CivicCentre"
names(marriage)[names(marriage)=="MARRIAGE_LICENSES"] <- "MarriageLicenses"

marriage$TimePeriod <- paste(marriage$TimePeriod,"-01",sep="")

marriage$TimePeriod <- as.Date(marriage$TimePeriod, "%Y-%m-%d")

ggplot(marriage,aes(x=TimePeriod, y=MarriageLicenses, fill=CivicCentre)) + geom_area(colour="black", size=.2, alpha=.4) + scale_fill_brewer(palette="BuPu",breaks=rev(levels(marriage$CivicCentre)))

ggtitle("Marriage Licenses Registered in Toronto")

ggplot(marriage,aes(x=TimePeriod, y=MarriageLicenses, colour=CivicCentre)) + geom_line() 
