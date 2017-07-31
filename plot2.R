data <- read.table('household_power_consumption.txt',header=TRUE,
                   sep=';',na.strings='?')

##  2007-02-01 is '1/2/2007'
subset_data <- subset(data, data$Date=='1/2/2007' | data$Date == '2/2/2007')


dates <- paste(subset_data$Date, subset_data$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

plot(datetime, subset_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()