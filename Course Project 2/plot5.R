# Course Project 2: Q5
##############################################################################################################################
# Check if both data exist. If not, load the data.
if (!"nei" %in% ls()) {
  nei <- readRDS("./data/summarySCC_PM25.rds")
}

if (!"scc" %in% ls()) {
  scc <- readRDS("./data/Source_Classification_Code.rds")
}

subset <- nei[nei$fips == "24510", ] 


par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot5.png", 
    width = 600, height = 600)

motor <- grep("motor", scc$Short.Name, ignore.case = T)
motor <- scc[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")
names(motorEmissions) <- c("Year", "Emissions")

ggplot(data=motorEmissions, aes(x=Year, y=Emissions)) + 
  geom_line(aes(col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle("Total Emissions from Motor Vehicle Sources from 1999 to 2008 in Baltimore City") + 
  ylab(expression('Total PM'[2.5]*" Emission")) + 
  geom_text(aes(label=round(Emissions, 2), size=2, hjust=0.5, vjust=2))

dev.off()

# © Liu Lee 2014 All Rights reserved.