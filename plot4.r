# Set working directory
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

# Set date & time as POSIX 
dataset$DateTime <- strptime((paste(dataset$Date, dataset$Time, sep="-")), format="%d/%m/%Y-%H:%M:%S")
# Set Sub_metering to numeric
dataset$Sub_metering_1 <- as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2 <- as.numeric(as.character(dataset$Sub_metering_2))
# Set Global_active,Voltage, Global_reactive_power to numeric
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
dataset$Voltage <- as.numeric(as.character(dataset$Voltage))
dataset$Global_reactive_power <- as.numeric(as.character(dataset$Global_reactive_power))
# Set pixels of png file
png(file = "plot4.png", width = 480, height = 480, units = "px")
# Create plots
par(mfcol=c(2,2))
# first plot "Global Active Power"
plot(dataset$DateTime, dataset$Global_active_power, type="l", 
     ylab="Global Active Power", xlab="")
#second plot "Energy sub metering":
plot(dataset$DateTime, dataset$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(dataset$DateTime, datset$Sub_metering_1, type="l", col="black")
lines(dataset$DateTime, dataset$Sub_metering_2, type="l", col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, type="l", col="blue")
# Set legend for second plot
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# third plot "Voltage"
plot(dataset$DateTime, dataset$Voltage, type="l", ylab="Voltage", xlab="datetime")
#fourth plot "Global reactive power"
plot(dataset$DateTime, dataset$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime")

	 dev.off()

