# for group_by
library(dplyr)
library(ggplot2)

# data source, assuming it is downloaded
file1URL <- "summarySCC_PM25.rds"
file2URL <- "Source_Classification_Code.rds"

# load data
NEI <- readRDS(file1URL)
SCC <- readRDS(file2URL)

# find vehicle mentions in SCC.Level.Two 
vehicleSCC <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE), "SCC"]

# extract sums
NEIsub <- subset(NEI, SCC %in% vehicleSCC & fips == "24510")
sum <- with(NEIsub, tapply(NEIsub$Emissions, NEIsub$year, sum, na.rm = TRUE))
df <- data.frame(year = names(sum), sum = sum)

# convert factor to numeric
df$year <- as.numeric(levels(df$year))[df$year]
df$sum <- df$sum

# plot
plotFile <- "plot5.png"
par(bg="white")
with(df, plot(year, sum, type="b", xlab="Year", ylab="Total Emissions from Motor Vehicles (tons)", ylim=c(0,500), xlim=c(1999,2008), main="#5 Total Emissions 1999-2008 from Motor Vehicles in Baltimore"))
dev.copy(png, height=480, width=480, pointsize=15, file=plotFile)
dev.off()
