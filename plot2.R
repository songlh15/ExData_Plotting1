
#check directory


if(getwd() != "C:/Users/Song/Dropbox/Coursera/Explotory")
  setwd("C:/Users/Song/Dropbox/Coursera/Explotory")

#read data in
#datain <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c('Date','character',rep('numeric',6),nrow=5))

datain <- read.table("household_power_consumption.txt",sep=";", colClasses="character", na.strings = "?",header=T)

#datain[,1] <- sapply(datain[,1],function(x) as.Date(x,format="%d/%m/%Y"))
#convert first varialbe to date

new <- paste(datain[,1],datain[,2])

daytime <- as.POSIXct(new, format="%Y-%m-%d %H:%M:%S")

#datain[,1] <- as.Date(datain[,1],format="%d/%m/%Y")

newdata <- cbind(datain,daytime=daytime)


#set date range for subsetting

enddate <- as.POSIXct("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S", tz="")
startdate <- as.POSIXct("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S", tz="")


#subset data 
plot2 <- newdata[(newdata[,10] >= startdate & newdata[,10] <= enddate),]

#convert variable 3:9 to numeric
plot2[,3:9] <- sapply(plot2[,3:9],as.numeric)


#draw graph 2
plot(plot2[,10],plot2[,3],pch=19,col="white",main=' ',xlab=' ',ylab='Global Active Power(kilowatts)')
lines(plot2[,10],plot2[,3])
 