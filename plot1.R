
# Download the file if not already
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

# Reading data
electricityConsumption <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetData <- electricityConsumption[electricityConsumption$Date %in% c("1/2/2007","2/2/2007"), ]
#View(subsetData)

# first plot
png("plot1.png", width = 480, height = 480)
Global_active_power <- as.numeric(subsetData$Global_active_power)
hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()