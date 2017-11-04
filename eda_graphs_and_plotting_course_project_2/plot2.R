# data source, assuming it is downloaded
file1URL <- "summarySCC_PM25.rds"
file2URL <- "Source_Classification_Code.rds"

# load data
NEI <- readRDS(file1URL)
SCC <- readRDS(file2URL)

# extract sums
NEIsub <- subset(NEI, fips == "24510")
sum <- with(NEIsub, tapply(NEIsub$Emissions, NEIsub$year, sum, na.rm = TRUE))
df <- data.frame(year = names(sum), sum = sum)

# convert factor to numeric
df$year <- as.numeric(levels(df$year))[df$year]
df$sum <- df$sum / 1000

# plot
plotFile <- "plot2.png"
par(bg="white")
with(df, plot(year, sum, type="b", xlab="Year", ylab="Total Emissions in Baltimore, Maryland (thousand tons)", xlim=c(1998,2009), ylim=c(0,4), main="#2 Total PM2.5 Emissions 1999-2008 in Baltimore"))
dev.copy(png, height=480, width=480, pointsize=15, file=plotFile)
dev.off()
