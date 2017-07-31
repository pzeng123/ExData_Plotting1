rm(list = ls())     # clear objects  
graphics.off()      # close graphics windows 
data <- read.table('household_power_consumption.txt',header=TRUE,
                   sep=';',na.strings='?')

##  2007-02-01 is '1/2/2007'
subset_data <- subset(data, data$Date=='1/2/2007' | data$Date == '2/2/2007')
dates <- paste(subset_data$Date, subset_data$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

## 2*2 sub plots
par(mfrow=c(2,2), xpd=TRUE)

# 1.
plot(datetime, subset_data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# 2.
plot(datetime, subset_data$Voltage, type="l", ylab="Voltage", 
     xlab="datetime")


# 3.
plot(datetime, subset_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")
lines(datetime, subset_data$Sub_metering_2, type="l", col="red")
lines(datetime, subset_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"),lty='solid', cex = 0.75, bty = "n", y.intersp=0.25)

# 4.
plot(datetime, subset_data$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime", xaxt="n")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()