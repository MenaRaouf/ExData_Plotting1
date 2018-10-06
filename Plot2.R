library(dplyr)

mydata <- read.csv("household_power_consumption.txt" , sep = ";")
mydata$Date <- as.Date( mydata$Date , format = "%d/%m/%Y")
mydata <- subset(mydata , mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02" )
mydata2 <- dplyr::as_data_frame(mydata)
mydata2$Global_active_power <- as.numeric(mydata$Global_active_power)

##plot 2
png("Plot 2.png", width = 480 , height = 480 , units = "px")
mydata2$date_time <- as.POSIXct(paste(mydata2$Date, mydata2$Time), format="%Y-%m-%d %H:%M:%S")
plot(mydata2$date_time , (mydata2$Global_active_power/1000) * 2  , type = "l" , ylab = "Global Active Power(Kilowatts)" , xlab = "")
dev.off()