# Course Project 2: Q2
##############################################################################################################################
# Check if both data exist. If not, load the data.
if (!"nei" %in% ls()) {
  nei <- readRDS("./data/summarySCC_PM25.rds")
}

if (!"scc" %in% ls()) {
  scc <- readRDS("./data/Source_Classification_Code.rds")
}

# Truncate required data
subset <- nei[nei$fips == "24510", ] 

totalEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

# Plot 2
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot2.png", 
    width = 600, height = 600)

plot(totalEmissions, type = "l", col = "blue", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

# © Liu Lee 2014 All Rights reserved.