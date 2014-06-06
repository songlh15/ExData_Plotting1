#This code is to draw figure 2

#check and set working directory

if(getwd() != "C:/Users/Song/Dropbox/Coursera/Explotory")
  setwd("C:/Users/Song/Dropbox/Coursera/Explotory")

#read data in

datain <- read.table("household_power_consumption.txt",sep=";", colClasses="character", na.strings = "?",header=T)


#combine date and time into one variable and add it to original data

new <- paste(datain[,1],datain[,2])

daytime <- as.POSIXct(new, format="%Y-%m-%d %H:%M:%S")

newdata <- cbind(datain,daytime=daytime)


#set date range for subsetting

enddate <- as.POSIXct("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S", tz="")
startdate <- as.POSIXct("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S", tz="")


#subset data 
plot2 <- newdata[(newdata[,10] >= startdate & newdata[,10] <= enddate),]

#convert variables from coloumn 3:9 to numeric
plot2[,3:9] <- sapply(plot2[,3:9],as.numeric)


#set graph to a single panel
par(mfcol=c(1,1),mar=c(4,4,2,2))


#draw graph 2
plot(plot2[,10],plot2[,3],pch=19,col="white",main=' ',xlab=' ',ylab='Global Active Power(kilowatts)')
lines(plot2[,10],plot2[,3])
 