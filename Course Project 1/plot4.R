#Plot 4
######################################################################################################
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

#Coz needed data is identical to plot1, so first check whether data is stored in global environment.
#If not, load the data.
if (!("mySql" %in% ls())) {
    mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
    myData <- read.csv2.sql("household_power_consumption.txt", mySql)
}

#Coz part of data is loaded in plot2.R, check whether data is stored in global environment.
#If not, load the data
if (!("SSDateTime" %in% ls())) {
    DateTime<-paste(myData$Date, myData$Time)
    SDateTime<-strptime(DateTime, "%d/%m/%Y %H:%M:%S")
    SSDateTime<-as.POSIXct(SDateTime)
}

# Change png format to save four plot. Open a png file and then draw 4 required pics into it. 
# At last close it.
png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfcol=c(2,2))
#Frist plot
plot(myData$Global_active_power ~ SSDateTime, type = "l", xlab = "", ylab = "Global Active Power")

#2nd plot
plot(myData$Sub_metering_1 ~ SSDateTime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(myData$Sub_metering_2 ~ SSDateTime, type = "l", col = "red")
lines(myData$Sub_metering_3 ~ SSDateTime, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), cex = 0.5, lty = "solid")

#3rd plot
plot(myData$Voltage ~ SSDateTime, type = "l", ylab = "Voltage", xlab = "datetime")

#4th plot
plot(myData$Global_reactive_power ~ SSDateTime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()


# © All Rights reserved by Liu Li 13/10/2014 .
