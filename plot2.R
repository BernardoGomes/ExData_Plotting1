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


plot(fdata$NewDate, 
     fdata$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()


