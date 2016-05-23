#Read data from files and make proper format.
full_data <- read.csv("household_power_consumption.txt",sep=';', header=T,na.strings="?",stringsAsFactors = F)
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")
part_data <- subset(full_data, full_data$Date>="2007-02-01" & full_data$Date <="2007-02-02")

#format the date 
datetime <- paste(as.Date(part_data$Date), part_data$Time)
part_data$Datetime <- as.POSIXct(datetime)

#Use the above date and draw energy sub meterting, form three lines on same chart and draw legend.
plot(part_data$Datetime, part_data$Sub_metering_1 ,type = "l", ylab="Energy sub metering(kilowatts)",xlab="", col="black")
lines(part_data$Datetime, part_data$Sub_metering_2 , col ="red")
lines(part_data$Datetime, part_data$Sub_metering_3 , col ="blue")
legend("topright", col =c("black","red","blue"),lty=1,lwd=2,legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Generate PNG file output
dev.copy(png,"plot3.png")
dev.off()