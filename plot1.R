# Power consumption dataset
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 05.08.2015

#reading data
data1 <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                    na.strings = "?")

# convert date and time
data1$DateTime <- strptime(paste0(data1$Date," ", data1$Time), "%d/%m/%Y %H:%M:%S")

# subsetting
data3 <- subset(data1, DateTime <= strptime("2007-02-02 23:59", "%Y-%m-%d %H:%M") &
                    DateTime >= strptime("2007-02-01", "%Y-%m-%d"))

# making plot and printing
hist(data3$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200),
     mgp = c(2,0.5,0), cex.lab = 3/4, cex.axis = 3/4, cex.main = 3/4)
dev.print(png, file = "plot1.png", width = 480, height = 480, units = "px")
