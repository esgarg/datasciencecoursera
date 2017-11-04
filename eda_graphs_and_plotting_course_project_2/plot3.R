# for group_by
library(dplyr)
library(ggplot2)

# data source, assuming it is downloaded
file1URL <- "summarySCC_PM25.rds"
file2URL <- "Source_Classification_Code.rds"

# load data
NEI <- readRDS(file1URL)
SCC <- readRDS(file2URL)

# extract sums
NEIsub <- subset(NEI, fips == "24510")
df <- data.frame(year=NEIsub$year, type=NEIsub$type, emissions=NEIsub$Emissions)

# convert year to factor
df$year <- factor(df$year)

# create sum
df <- 
	df %>%
	group_by(year, type) %>%
	summarize(total=sum(emissions))

# plot
plotFile <- "plot3.png"
p <- ggplot(data=df, aes(x=year, y=total, color=type)) + 
	geom_line(aes(group=type)) + 
	geom_point() + 
	labs(x="Year", y="Total Emissions (tons)", title="#3 Total PM2.5 Emissions 1999-2008 by source")
ggsave(plotFile)
