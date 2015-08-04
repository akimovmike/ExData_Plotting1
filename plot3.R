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
Sys.setlocale("LC_TIME", "en_US") # for compatibility
plot(data3$DateTime, data3$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering", cex.lab = 3/4, cex.axis = 3/4, mgp = c(2,0.5,0))
lines(data3$DateTime, data3$Sub_metering_2, col = "red")
lines(data3$DateTime, data3$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), cex = 2/3, y.intersp = 0.8)
dev.print(png, file = "plot3.png", width = 480, height = 480, units = "px")
