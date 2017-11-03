# data source, assuming it is downloaded
fileURL <- "household_power_consumption.txt"

# create the grep command
grepCMD <- paste("grep", "^[12]/2/2007", fileURL, "2>/dev/null")

# get the colNames by only reading one line
colNames <- colnames(read.table(fileURL, nrows=1, header=TRUE, sep=";", na.strings="?"))

# read only selected dates from the DB and assign colNames
epcData <- read.table(pipe(grepCMD), sep=";", na.strings="?", col.names=colNames)

# convert dates
epcData$Date <- as.Date(epcData$Date, format="%d/%m/%Y")

# convert time, assuming timezone is Paris/France since data is contributed from Clamart, France
tz <- "Europe/Paris"
epcData$Time <- strptime(paste(epcData$Date, epcData$Time), format="%Y-%m-%d %H:%M:%S", tz="Europe/Paris")

# plot4.png
plotFile <- "plot4.png"
par(mfrow=c(2,2), bg="white", cex=0.8)
plot(epcData$Time, epcData$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(epcData$Time, epcData$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(epcData$Time, epcData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(epcData$Time, epcData$Sub_metering_2, type="l", col="red")
lines(epcData$Time, epcData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), bty="n")
plot(epcData$Time, epcData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, height=480, width=480, file=plotFile)
dev.off()
