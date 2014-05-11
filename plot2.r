# set working directory
setwd("~/Downloads/GetData")
# Using SQL library
library(sqldf)
# Read required data into dataset
file <- "household_power_consumption.txt"
init <- read.table(file,header = TRUE,nrows=100,sep = ";")
classes <- sapply(init,class)
data <- read.csv2.sql(file,
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE,
                      sep=";",
                      colClasses=classes,
                      comment.char = "",
                      na.strings = "?")

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
