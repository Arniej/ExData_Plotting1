##Plot 3 code

##Read file

alldata <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


##Subset the 2 days of interest

subsetdata <- alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
rm(alldata)


##Change date to date class
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")

##Change time class

subsetdata$Time <- strptime(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S")

##Create plot

plot(subsetdata$Time, subsetdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subsetdata$Time, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$Time, subsetdata$Sub_metering_3, col="blue")

##Create top right hand legend

legend('topright', lty=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') )


##Create png file

dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()