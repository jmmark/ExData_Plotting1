## first plotting file for Assignment 1 of Getting and Cleaning Data
## create a histogram og Global Active Power for the target date range
## assumes file household_power_consumption.txt is in the current wd

## step 1, read in the raw data.  sep is ";", NA is denoted "?"

allData <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na.str = "?")

## step 2, convert the dates, subset for the appropriate days, clean up memory, convert time

allData$Date <- as.Date(strptime(allData$Date, format="%d/%m/%Y"))
keepData <- allData[allData$Date >= as.Date("2007-02-01") & allData$Date <= as.Date("2007-02-02"),]
rm(allData)
keepData$Time <- strptime(paste(keepData$Date, keepData$Time), format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

##step 3, open ghe graphical device and create 3-line plot and legend
png("plot3.png", width = 480, height = 480)
    plot(keepData$Time, keepData$Sub_metering_1, xlab = "", 
         ylab = "Endergy sub metering", type = "l")
    lines(keepData$Time, keepData$Sub_metering_2, col = "red")
    lines(keepData$Time, keepData$Sub_metering_3, col = "blue")
    legend(x="topright",legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
           lty = c(1,1), col = c("black","red","blue"))
dev.off()