###########################  plot2  ###################################################
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

# Setting the LC_TIME to fix the flaw that DateTime label shown in Chinese
Sys.setlocale(category = "LC_TIME", locale = "C")

dat1$DateTime <- strptime(paste(dat1$Date,dat1$Time),"%d/%m/%Y %H:%M:%S")

# plot2： the plot of Global Active Power vs Date Time
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(x = dat1$DateTime, y = dat1$Global_active_power,type = "l",xlab = "", 
        ylab = "Global Active Power(kilowatts)")

dev.off()
