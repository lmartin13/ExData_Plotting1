data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
use <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02",]
use$Global_active_power <- as.numeric(as.character(use$Global_active_power))
png(filename = "plot1.png", width = 480, height = 480)
hist(use$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()