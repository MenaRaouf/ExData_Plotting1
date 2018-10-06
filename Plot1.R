library(dplyr)

mydata <- read.csv("household_power_consumption.txt" , sep = ";")
mydata$Date <- as.Date( mydata$Date , format = "%d/%m/%Y")
mydata <- subset(mydata , mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02" )
mydata2 <- dplyr::as_data_frame(mydata)
mydata2$Global_active_power <- as.numeric(mydata$Global_active_power)


##plot 1
png("Plot 1.png", width = 480 , height = 480 , units = "px")
hist((mydata2$Global_active_power/1000) * 2 , col = "red" , xlab = "Global Active Power(Kilowatts)" , main = "Global Active Power")
dev.off()