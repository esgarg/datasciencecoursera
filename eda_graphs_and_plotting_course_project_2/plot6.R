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
NEIsub <- subset(NEI, (SCC %in% vehicleSCC) & (fips=="24510" | fips=="06037"))
df <- data.frame(year=NEIsub$year, fips=NEIsub$fips, emissions=NEIsub$Emissions)

# convert factor to numeric
df$year <- factor(df$year)

# create sum
df <-
	df %>%
	group_by(year, fips) %>%
	summarize(total=sum(emissions))

# fix fips to city names
names(df) <- sub("fips", "city", names(df))
df$city <- gsub("06037", "Los Angeles", df$city)
df$city <- gsub("24510", "Baltimore", df$city)

# plot
plotFile <- "plot6.png"
p <- ggplot(data=df, aes(x=year, y=total, color=city)) + 
	geom_line(aes(group=city)) + 
	geom_point() + 
	labs(x="Year", y="Total Emissions (tons)", title="#6 Total PM2.5 Emissions 1999-2008 by Motor Vehicles in LA vs. Baltimore")
ggsave(plotFile)
