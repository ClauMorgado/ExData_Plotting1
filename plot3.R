data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

gap <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

gap$DateTime <- strptime(paste(gap$Date, gap$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

Sys.setlocale("LC_ALL","C")

plot(gap$DateTime, as.numeric(gap$Sub_metering_1)
     , type="l", xlab = "", ylab = "Energy sub metering")

lines(gap$DateTime, as.numeric(gap$Sub_metering_1), col = "black")
lines(gap$DateTime, as.numeric(gap$Sub_metering_2), col = "red")
lines(gap$DateTime, as.numeric(gap$Sub_metering_3), col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

dev.off()