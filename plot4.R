## read data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
## add the date to the times
data$Time <- paste(data$Date, data$Time, sep = " ")
## format date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## filter data
use <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02",]
## format time
use$Time <- strptime(use$Time, "%d/%m/%Y %H:%M:%S")
## format rest of data
use$Sub_metering_1 <- as.numeric(as.character(use$Sub_metering_1))
use$Sub_metering_2 <- as.numeric(as.character(use$Sub_metering_2))
use$Sub_metering_3 <- as.numeric(as.character(use$Sub_metering_3))
use$Global_active_power <- as.numeric(as.character(use$Global_active_power))
use$Voltage <- as.numeric(as.character(use$Voltage))
use$Global_reactive_power <- as.numeric(as.character(use$Global_reactive_power))
## use png device
png(filename = "plot4.png", width = 480, height = 480)
## format graphs 2 by 2
par(mfrow = c(2,2))
##draw first graph
with(use, plot(Time, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))
lines(use$Time, use$Global_active_power)
## draw second graph
with(use, plot(Time, Voltage, xlab = "datetime", type = "n"))
with(use, lines(Time, Voltage))
## draw third graph
plot(use$Time, use$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(use$Time, use$Sub_metering_1, col="black")
lines(use$Time, use$Sub_metering_2, col="red")
lines(use$Time, use$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), lty = 1, bty = "n")
## draw fourth graph
with(use, plot(Time, Global_reactive_power, xlab = "datetime", type = "n"))
with(use, lines(Time, Global_reactive_power))
## turn off png device
dev.off()
