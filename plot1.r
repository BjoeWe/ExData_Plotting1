# set working directory
setwd("~/Downloads/GetData")
# Using SQL library
library(sqldf)
# Read required data into dataset
dataset <- read.csv.sql("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?"
                   sql="select * from file where Date = '2/2/2007' or Date = '1/2/2007'")
# Create the histogram
par(mfrow = c(1,1))
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col="red")
# Save the histogram
dev.copy(png, file="plot1.png", width=480, height = 480)
dev.off()
