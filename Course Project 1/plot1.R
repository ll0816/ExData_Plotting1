#Plot 1
###################################################################################################
#Check whether necessary package has loaded, if not, check whether it's installed or not.
#If not, script will automatically have it installed.
if (!("sqldf" %in% (.packages()))) {
    packagelist <- c("sqldf")
    newpackage <- packagelist[!(packagelist %in% installed.packages()[,"Package"])]
    if(length(newpackage)>0) install.packages(newpackage)
    sapply(packagelist, require, character.only=TRUE, quietly=TRUE)
}

#Check whether datafile exsits
if (!file.exists("household_power_consumption.txt")) {
    stop("Hey dude! Can't find the data txt under your working directory")
}

#Load Data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt", mySql)

#Open a png file and then draw pic into it. At last close it.
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(myData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

# © All Rights reserved by Liu Li 13/10/2014 .
