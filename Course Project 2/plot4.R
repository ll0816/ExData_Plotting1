# Course Project 2: Q4
##############################################################################################################################
# Load ggplot2 library
require(ggplot2)

# Check if both data exist. If not, load the data.
if (!"nei" %in% ls()) {
  nei <- readRDS("./data/summarySCC_PM25.rds")
}

if (!"scc" %in% ls()) {
  scc <- readRDS("./data/Source_Classification_Code.rds")
}
head(scc$Short.Name)

# Plot 4
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot4.png", 
    width = 600, height = 600)

coal <- grep("coal", scc$Short.Name, ignore.case = T)
coal <- scc[coal, ]
coal <- nei[nei$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")
names(coalEmissions) <- c("Year", "Emissions")

ggplot(data=coalEmissions, aes(x=Year, y=Emissions)) + 
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle('Total Emissions Across U.S. from Coal Combustion-Related Sources from 1999 to 2008') + 
  ylab(expression('Total PM'[2.5]*" Emission")) + 
  geom_text(aes(label=round(Emissions, 2), size=2, hjust=0.5, vjust=2)) 

dev.off()


# © Liu Lee 2014 All Rights reserved.