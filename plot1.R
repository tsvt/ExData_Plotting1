rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
rawData$Date <- as.Date(strptime(rawData$Date, "%d/%m/%Y"))
data <- subset(rawData, Date == "2007-02-01" | Date == "2007-02-02")
rm(rawData)

png(filename = "plot1.png", width = 480, height = 480) 
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = 'Global Active Power (kilowatts)'))
dev.off()