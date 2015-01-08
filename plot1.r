## plot1
# Read the household power consumption data
# rawData <- read.table("household_power_consumption.txt", sep = ";", head = TRUE, 
# na.strings = "?", colClasses = c("character","character","numeric", "numeric","numeric", 
# "numeric","numeric", "numeric","numeric"))
# head(rawData)

# # Select sample data from the dates 2007-02-01 and 2007-02-02
# Index <- rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007"
# dat1 <- rawData[Index,]


# Another way to read the sample data from the dates 2007-02-01 and 2007-02-02
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

# plot1： the histogram of Global Active Power
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(dat1$Global_active_power, col = "red", main = "Global Active Power", 
        xlab = "Global Active Power(kilowatts)")
dev.off()

