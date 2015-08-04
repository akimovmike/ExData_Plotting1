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
par(mfrow = c(2,2), cex = 0.5, cex.lab = 1, cex.axis = 1)

plot(data3$DateTime, data3$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "",
     mgp = c(2,0.5,0))

plot(data3$DateTime, data3$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime",
     mgp = c(2,0.5,0))

plot(data3$DateTime, data3$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering", mgp = c(2,0.5,0))
lines(data3$DateTime, data3$Sub_metering_2, col = "red")
lines(data3$DateTime, data3$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"),  y.intersp = 0.6, xjust = 1, yjust = 1,
       bty = "n")

plot(data3$DateTime, data3$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime",
     mgp = c(2,0.5,0))

dev.print(png, file = "plot4.png", width = 480, height = 480, units = "px")
