data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
use <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02",]
use$Time <- strptime(use$Time, "%d/%m/%Y %H:%M:%S")
use$Global_active_power <- as.numeric(as.character(use$Global_active_power))
png(filename = "plot2.png", width = 480, height = 480)
with(use, plot(Time, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))
lines(use$Time, use$Global_active_power)
dev.off()

