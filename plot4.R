rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
rawData$Date <- as.Date(strptime(rawData$Date, "%d/%m/%Y"))
data <- subset(rawData, Date == "2007-02-01" | Date == "2007-02-02")
rm(rawData)

time <- strptime(data$Time, format = "%H:%M:%S")
time <- time$hour + time$min/60 + time$sec/3600
data$Time <- (time/24) + as.numeric(data$Date == "2007-02-02")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

with(data, plot(Time, Global_active_power, type="l", xlab = "", ylab="Global Active Power", xaxt = "n"))
axis(1,0:2,c("Thu","Fri","Sat"))

with(data, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage",xaxt="n"))
axis(1,0:2,c("Thu","Fri","Sat"))

with(data, plot(Time, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering",xaxt="n"))
axis(1,0:2,c("Thu","Fri","Sat"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), box.lwd=0, lty = 1)

with(data, plot(Time, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime",xaxt="n",type="l"))
axis(1,0:2,c("Thu","Fri","Sat"))

dev.off()