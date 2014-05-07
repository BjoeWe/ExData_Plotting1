# set working directory
setwd("~/Downloads/GetData")
# Using SQL library
library(sqldf)
# Read required data into dataset
dataset <- read.csv.sql("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?"
                   sql="select * from file where Date = '2/2/2007' or Date = '1/2/2007'")
## set date & time as POSIX 
dataset$DateTime <- strptime((paste(dataset$Date, dataset$Time, sep="-")), format="%d/%m/%Y-%H:%M:%S")
# set global active power from factor to numeric
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
# set pixels of png file
png(file = "plot2.png", width = 480, height = 480, units = "px")
## create plot
plot(dataset$DateTime, dataset$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
