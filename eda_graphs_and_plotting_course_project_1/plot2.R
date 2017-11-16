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

# plot2.png
plotFile <- "plot2.png"
par(bg="white")
plot(epcData$Time, epcData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, height=480, width=480, pointsize=15, file=plotFile)
dev.off()
