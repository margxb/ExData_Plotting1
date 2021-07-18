library(readr)
library(lubridate)
library(dplyr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power$Date <- dmy(power$Date)
power <- filter(power, Date >= ("2007-02-01") & Date <= ("2007-02-02"))

power$datetime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480)

par(mfrow = c(1, 1), mar = c(4, 4, 2, 2))

hist(as.numeric(power$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()