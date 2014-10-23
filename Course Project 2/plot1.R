# Course Project 2: Q1
##############################################################################################################################
# Check if both data exist. If not, load the data.
if (!"nei" %in% ls()) {
    nei <- readRDS("./data/summarySCC_PM25.rds")
}

if (!"scc" %in% ls()) {
    scc <- readRDS("./data/Source_Classification_Code.rds")
}

head(nei)
head(scc)
dim(nei) # 6497651   6
dim(scc) # 11717    15

totalEmissions <- aggregate(nei$Emissions, list(nei$year), FUN = "sum")

# Plot 1
par("mar"=c(5.1, 4.5, 4.1, 2.1))

png(filename = "./figure/plot1.png", 
    width = 600, height = 600)

plot(totalEmissions, type = "l", col = 'blue', xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

# © Liu Lee 2014 All Rights reserved.