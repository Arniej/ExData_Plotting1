##Plot 4 code

##Read file

alldata <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


##Subset the 2 days of interest

subsetdata <- alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
rm(alldata)


##Change date to date class
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")

##Change time class

subsetdata$Time <- strptime(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S")

##Create plots

par(mfrow = c(2,2))

##Top left
with(subsetdata, plot(Time, Global_active_power, type="l",xlab = "", ylab="Global Active Power (in kilowatts)"))

#Top Right
with(subsetdata, plot(Time, Voltage, type = "l", xlab='datetime', ylab='Voltage'))

##Bottom Left

plot(subsetdata$Time, subsetdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subsetdata$Time, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$Time, subsetdata$Sub_metering_3, col="blue")

##Bottom right

with(subsetdata, plot(Time, Global_reactive_power,type="l", xlab="datetime", 
                         ylab="Global_reactive_power",))
##Create top right hand legend




##Create png file

##dev.copy(png,'plot4.png',  width = 480, height = 480)
##dev.off()