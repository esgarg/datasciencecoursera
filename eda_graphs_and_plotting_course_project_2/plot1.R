# data source, assuming it is downloaded
file1URL <- "summarySCC_PM25.rds"
file2URL <- "Source_Classification_Code.rds"

# load data
NEI <- readRDS(file1URL)
SCC <- readRDS(file2URL)

# extract sums
sum <- with(NEI, tapply(NEI$Emissions, NEI$year, sum, na.rm = TRUE))
df <- data.frame(year = names(sum), sum = sum)

# convert factor to numeric
df$year <- as.numeric(levels(df$year))[df$year]
df$sum <- df$sum / 1000000

# plot
plotFile <- "plot1.png"
par(bg="white")
with(df, plot(year, sum, type="b", xlab="Year", ylab="Total Emissions (million tons)", xlim=c(1998,2009), ylim=c(0, 8), main="#1 Total PM2.5 Emissions 1999-2008"))
dev.copy(png, height=480, width=480, pointsize=15, file=plotFile)
dev.off()
