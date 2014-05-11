rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
rawData$Date <- as.Date(strptime(rawData$Date, "%d/%m/%Y"))
data <- subset(rawData, Date == "2007-02-01" | Date == "2007-02-02")
rm(rawData)

png(filename = "plot2.png", width = 480, height = 480)
time <- strptime(data$Time, format = "%H:%M:%S")
time <- time$hour + time$min/60 + time$sec/3600
data$Time <- (time/24) + as.numeric(data$Date == "2007-02-02")

with(data, plot(Time, Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)", xaxt = "n"))
axis(1,0:2,c("Thu","Fri","Sat"))
dev.off()