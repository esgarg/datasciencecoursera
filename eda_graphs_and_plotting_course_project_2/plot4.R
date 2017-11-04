# for group_by
library(dplyr)
library(ggplot2)

# data source, assuming it is downloaded
file1URL <- "summarySCC_PM25.rds"
file2URL <- "Source_Classification_Code.rds"

# load data
NEI <- readRDS(file1URL)
SCC <- readRDS(file2URL)

# find combustion mentions in Level.One AND coal mentions in Level.Four
comb <- grep("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grep("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coalcombSCC <- SCC[intersect(comb, coal), "SCC"]

# extract sums
NEIsub <- subset(NEI, SCC %in% coalcombSCC)
sum <- with(NEIsub, tapply(NEIsub$Emissions, NEIsub$year, sum, na.rm = TRUE))
df <- data.frame(year = names(sum), sum = sum)

# convert factor to numeric
df$year <- as.numeric(levels(df$year))[df$year]
df$sum <- df$sum / 100000

# plot
plotFile <- "plot4.png"
par(bg="white")
with(df, plot(year, sum, type="b", xlab="Year", ylab="Total Emissions from Coal Combustion (10^5 tons)", ylim=c(0, 6), xlim=c(1999,2008), main="#4 Total Emissions 1999-2008 from Coal Combustion"))
dev.copy(png, height=480, width=480, pointsize=15, file=plotFile)
dev.off()
