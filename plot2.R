data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

gap <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

gap$DateTime <- strptime(paste(gap$Date, gap$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

Sys.setlocale("LC_ALL","C")

plot(gap$DateTime, as.numeric(gap$Global_active_power), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()