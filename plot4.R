
#This code is to draw figure 4


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


#draw graph 4

#set graph to 2 by 2 panels

par(mfcol=c(2,2),mar=c(4,4,1,1))

#panel 1
plot(plot2[,10],plot2[,3],pch=19,col="white",main=' ',xlab=' ',ylab='Global Active Power(kilowatts)')
lines(plot2[,10],plot2[,3])

#panel 2
plot(plot2[,10],plot2[,7],pch=19,col="white",main=' ',xlab=' ',ylab='Energy sub metering')
lines(plot2[,10],plot2[,7],col='black')
lines(plot2[,10],plot2[,8],col='red')
lines(plot2[,10],plot2[,9],col='blue')
legend("topright", lty= c(1,1,1), cex=0.75,
       col = c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),bty="n" )

#panel 3
plot(plot2[,10],plot2[,5],col='white',main='',xlab='datetime',ylab='Voltage')
lines(plot2[,10],plot2[,5])

#panel 4
plot(plot2[,10],plot2[,4],col='white',main='',xlab='datetime',ylab='Global_reactive_power')
axis(side=2,at=c(0.1,0.2,0.3,0.4,0.5))
lines(plot2[,10],plot2[,4])