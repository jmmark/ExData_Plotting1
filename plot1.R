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

##step 3, open ghe graphical device and create the histogram
png("plot1.png", width = 480, height = 480)
    hist(keepData$Global_active_power, col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()