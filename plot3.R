rm(list = ls())     # clear objects  
graphics.off()      # close graphics windows 
data <- read.table('household_power_consumption.txt',header=TRUE,
                   sep=';',na.strings='?')

##  2007-02-01 is '1/2/2007'
subset_data <- subset(data, data$Date=='1/2/2007' | data$Date == '2/2/2007')

dates <- paste(subset_data$Date, subset_data$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

plot(datetime, subset_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")
lines(datetime, subset_data$Sub_metering_2, type="l", col="red")
lines(datetime, subset_data$Sub_metering_3, type="l", col="blue")
legend('topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"),lty='solid', cex = 0.8, y.intersp=0.5)


dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()