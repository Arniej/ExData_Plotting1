##Plot 1 code

##Read file

alldata <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


##Subset the 2 days of interest

subsetdata <- alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
rm(alldata)


##Change date to date class
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")

##Change time class

subsetdata$Time <- strptime(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S")

##Create histogram

with(subsetdata, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
                         main="Global Active Power"))

##Create png file

dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()

