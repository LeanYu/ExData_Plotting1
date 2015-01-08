###########################  plot4  ###################################################
# Read the sample data from the dates 2007-02-01 and 2007-02-02
rm(list = ls())
firstLine <- 66636 # the first line where Date = "1/2/2007"
lastLine <- 69516  # the last line where Date = "2/2/2007"
dat1 <- read.table("household_power_consumption.txt", sep = ";", head = TRUE, 
        na.strings = "?", colClasses = c("character","character","numeric", 
		"numeric","numeric", "numeric","numeric", "numeric","numeric"), 
		col.names = c("Date","Time","Global_active_power","Global_reactive_power",
		"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        skip = firstLine, nrows = lastLine-firstLine)

# Check
dat1[1,]
dat1[dim(dat1)[1],]

dat1$DateTime <- strptime(paste(dat1$Date,dat1$Time),"%d/%m/%Y %H:%M:%S")

# plot4： Four figures

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# subplot 1
plot(x = dat1$DateTime, y = dat1$Global_active_power,type = "l",
    xlab = "", ylab = "Global Active Power")
# subplot 2
plot(x = dat1$DateTime, y = dat1$Voltage, type = "l",
    xlab = "datetime", ylab = "Voltage")
# subplot 3
plot(x = dat1$DateTime, y = dat1$Sub_metering_1, type = "l", 
    xlab = "", ylab = "Energy sub metering")
lines(x = dat1$DateTime, y = dat1$Sub_metering_2, col = "red")
lines(x = dat1$DateTime, y = dat1$Sub_metering_3, col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	lty = c(1,1,1),col=c("black","red","blue"),bty = 'n')
# subplot 4
plot(x = dat1$DateTime, y = dat1$Global_reactive_power, type = "l",
    xlab = "datetime", ylab = "Global_reactive_power")

dev.off()