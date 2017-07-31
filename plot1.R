rm(list = ls())     # clear objects  
graphics.off()      # close graphics windows
data <- read.table('household_power_consumption.txt',header=TRUE,
                   sep=';',na.strings='?')

##  2007-02-01 is '1/2/2007'
subset_data <- subset(data, data$Date=='1/2/2007' | data$Date == '2/2/2007')

## first plot
hist(subset_data$Global_active_power, col = 'red', 
     xlab = "Global Active Power (kilowatts)", 
     main =  "Global Active Power")


## save plot1 to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
