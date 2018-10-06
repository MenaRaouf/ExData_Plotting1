library(dplyr)

mydata <- read.csv("household_power_consumption.txt" , sep = ";")
mydata$Date <- as.Date( mydata$Date , format = "%d/%m/%Y")
mydata <- subset(mydata , mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02" )
mydata2 <- dplyr::as_data_frame(mydata)
mydata2$Global_active_power <- as.numeric(mydata$Global_active_power)

##Plot 4 

png("Plot 4.png" , width = 480 , height = 480 , units = "px")

mydata2$Global_reactive_power <- as.numeric(mydata2$Global_reactive_power)
mydata2$Sub_metering_1 <- as.numeric(mydata2$Sub_metering_1)
mydata2$Sub_metering_2 <- as.numeric(mydata2$Sub_metering_2)
mydata2$Sub_metering_3 <- as.numeric(mydata2$Sub_metering_3)
mydata2$date_time <- as.POSIXct(paste(mydata2$Date, mydata2$Time), format="%Y-%m-%d %H:%M:%S")


par(mfrow = c(2,2))
par(cex = 0.9)

plot(mydata2$date_time , (mydata2$Global_active_power/1000) * 2  , type = "l" , ylab = "Global Active Power" , xlab = "")

plot(mydata2$date_time , mydata2$Voltage  , type = "l" , ylab = "Global Active Power" , xlab = "")

plot(mydata2$date_time , mydata2$Sub_metering_1  , type = "l" , ylab = "Global Active Power(Kilowatts)" , xlab = "" , col = "black")

lines(mydata2$date_time , mydata2$Sub_metering_2  , type = "l" , ylab = "Global Active Power(Kilowatts)" , xlab = "" , col = "red")

lines(mydata2$date_time , mydata2$Sub_metering_3  , type = "l" , ylab = "Global Active Power(Kilowatts)" , xlab = "" , col = "blue")

legend("topright" , c("Sub_metering_1","Sub_metering_2" , "Sub_metering_3") , col = c("black" , "red" , "blue") , lty = 1 )

plot(mydata2$date_time , (mydata2$Global_reactive_power/500) , type = "l" , ylab = "Global_reactive_power" , xlab = "datetime")


dev.off()
