# Course Project 2: Q3
##############################################################################################################################
# Load Package
require(ggplot2)
# Check if both data exist. If not, load the data.
if (!"nei" %in% ls()) {
  nei <- readRDS("./data/summarySCC_PM25.rds")
}

if (!"scc" %in% ls()) {
  scc <- readRDS("./data/Source_Classification_Code.rds")
}

subset <- nei[nei$fips == "24510", ] 

# Plot 3
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot3.png", 
    width = 600, height = 600)

g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()


# © Liu Lee 2014 All Rights reserved.