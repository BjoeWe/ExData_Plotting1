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

# Create the histogram
par(mfrow = c(1,1))
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col="red")
# Save the histogram
dev.copy(png, file="plot1.png", width=480, height = 480)
dev.off()
