library(dplyr)

mydata <- read.csv("household_power_consumption.txt" , sep = ";")
mydata$Date <- as.Date( mydata$Date , format = "%d/%m/%Y")
mydata <- subset(mydata , mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02" )
mydata2 <- dplyr::as_data_frame(mydata)
mydata2$Global_active_power <- as.numeric(mydata$Global_active_power)

##plot 3 
png("Plot 3.png", width = 480 , height = 480 , units = "px")

mydata2$Sub_metering_1 <- as.numeric(mydata2$Sub_metering_1)
mydata2$Sub_metering_2 <- as.numeric(mydata2$Sub_metering_2)
mydata2$Sub_metering_3 <- as.numeric(mydata2$Sub_metering_3)
mydata2$date_time <- as.POSIXct(paste(mydata2$Date, mydata2$Time), format="%Y-%m-%d %H:%M:%S")



plot(mydata2$date_time , mydata2$Sub_metering_1  , type = "l" , ylab = "Global Active Power(Kilowatts)" , xlab = "" , col = "black")

lines(mydata2$date_time , mydata2$Sub_metering_2  , type = "l" , ylab = "Global Active Power(Kilowatts)" , xlab = "" , col = "red")

lines(mydata2$date_time , mydata2$Sub_metering_3  , type = "l" , ylab = "Global Active Power(Kilowatts)" , xlab = "" , col = "blue")

legend("topright" , c("Sub_metering_1","Sub_metering_2" , "Sub_metering_3") , col = c("black" , "red" , "blue") , lty = 1 )

dev.off()
