library(readr)
library(lubridate)
library(dplyr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power$Date <- dmy(power$Date)
power <- filter(power, Date >= ("2007-02-01") & Date <= ("2007-02-02"))

power$datetime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

par(mfrow = c(1, 1), mar = c(3, 4, 2, 2))

plot(power$datetime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Killowatts)")

dev.off()