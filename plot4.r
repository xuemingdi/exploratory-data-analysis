#Read data from files and make proper format.
full_data <- read.csv("household_power_consumption.txt",sep=';', header=T,na.strings="?",stringsAsFactors = F)
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")
part_data <- subset(full_data, full_data$Date>="2007-02-01" & full_data$Date <="2007-02-02")


#format the date 
datetime <- paste(as.Date(part_data$Date), part_data$Time)
part_data$Datetime <- as.POSIXct(datetime)

#partition the screen for four charts,and draw them individually.
par(mfrow =c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(data,
     {plot(Datetime, Global_active_power ,type = "l", ylab="Global Active Power",xlab="")
       plot(Datetime, Voltage ,type = "l", ylab="Voltage",xlab="datetime")
       plot(Datetime, Sub_metering_1 ,type = "l", ylab="Energy sub metering",xlab="", col="black")
       lines(Datetime,Sub_metering_2 , col ="red")
       lines(Datetime,Sub_metering_3 , col ="blue")
       legend("topright", col =c("black","red","blue"),lty=1,lwd=2,legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
       plot(Datetime, Global_reactive_power ,type = "l", ylab="Global_reactive_power",xlab="datetime")            
     }
)

#Generate PNG file output
dev.copy(png,"plot4.png")
dev.off()