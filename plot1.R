#This code is to draw figure 1

#check directory

if(getwd() != "C:/Users/Song/Dropbox/Coursera/Explotory")
  setwd("C:/Users/Song/Dropbox/Coursera/Explotory")

#read data in
 
datain <- read.table("household_power_consumption.txt",sep=";", colClasses="character",na.string="?",header=T)

#convert variable Date to date type

datain[,1] <- as.Date(datain[,1],format="%d/%m/%Y")

#set date range for subsetting

 enddate <- as.Date("02/02/2007", "%d/%m/%Y")
 startdate <- as.Date("01/02/2007","%d/%m/%Y")

#subset data 
datains <- datain[(datain[,1] >= startdate & datain[,1] <= enddate),]

#convert variable 3:9 to numeric
datains[,3:9] <- sapply(datains[,3:9],as.numeric)

#set graph to a single panel
par(mfcol=c(1,1),mar=c(4,4,2,2))


#draw graph 1
hist(datains[,3],xlab='Global Active Power(kilowatts)',
     freq=T,main="Global Active Power",col="red")
axis(side=2,at=c(200,400,600,800,1000,1200))
