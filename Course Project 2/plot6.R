# Course Project 2: Q6
##############################################################################################################################
#load package
require(ggplot2)

# Check if both data exist. If not, load the data.
if (!"nei" %in% ls()) {
  nei <- readRDS("./data/summarySCC_PM25.rds")
}

if (!"scc" %in% ls()) {
  scc <- readRDS("./data/Source_Classification_Code.rds")
}

subset <- nei[nei$fips == "24510"|nei$fips == "06037", ]

motor <- grep("motor", scc$Short.Name, ignore.case = T)
motor <- scc[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

#Plot 6
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot6.png", 
    width = 600, height = 600)
g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") + 
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Comparison of Total Emissions From Motor Vehicle Sources in Baltimore City and Los Angeles County\n from 1999 to 2008") +
    scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

dev.off()

# © Liu Lee 2014 All Rights reserved.