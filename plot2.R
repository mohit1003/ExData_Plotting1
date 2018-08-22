zipURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFileName <- "household_power_consumption.zip"

if(!file.exists(zipFileName)){
  download.file(zipURL, zipFileName)
}

dataPath <- "household_power_consumption"

if(!file.exists(dataPath)){
  unzip(zipFileName)
  dataFile <- "household_power_consumption.txt"
  #print("ok")
}else {
  stop()
}

electricityData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- electricityData[electricityData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()