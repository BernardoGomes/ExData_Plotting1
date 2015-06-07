#project #01 -  Exploratory Data Analysis

library(dplyr)

#this script assumes that your working directory 
#contains the file already unzipped. 
#uncomment the following line to get to the right directory
setwd("C:/Users/Bernardo/Documents/Coursera/04 - Exploratory Data Analysis/Code")

file <- "household_power_consumption.txt"

data <- read.csv(file, header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)

nrow(data) #should be 2.075.259
ncol(data) #should be 9

fdata <- filter(data, Date =='1/2/2007' | Date == '2/2/2007')

fdata$NewDate <- strptime(paste(fdata$Date, fdata$Time), "%d/%m/%Y %T")

summary(fdata)
windows()

par(mfrow = c(2,2))

plot(fdata$NewDate, 
     fdata$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power")

plot(fdata$NewDate, 
     fdata$Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Global Active Power")

plot(fdata$NewDate, 
     fdata$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")

lines(fdata$NewDate, fdata$Sub_metering_2, col="red")
lines(fdata$NewDate, fdata$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch="_")

plot(fdata$NewDate, 
     fdata$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")



#to print this plot I resized it a little bit in order to fit better 
dev.copy(png, file = "plot4.png", width=504, height=504)
dev.off()


