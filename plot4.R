library(readr)
library(lubridate)
library(dplyr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power$Date <- dmy(power$Date)
power <- filter(power, Date >= ("2007-02-01") & Date <= ("2007-02-02"))

power$datetime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 1, 2))

plot(power$datetime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(power$datetime, power$Voltage/1000, type = "l", xlab = "datetime", ylab = "Voltage")

plot(power$datetime, power$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(power$datetime, power$Sub_metering_2, col = "red")
lines(power$datetime, power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.6, lty = 1)

plot(power$datetime, power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()