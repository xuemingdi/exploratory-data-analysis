#Read data from files and make proper format.
full_data <- read.csv("household_power_consumption.txt",sep=';', header=T,na.strings="?",stringsAsFactors = F)
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")
part_data <- subset(full_data, full_data$Date>="2007-02-01" & full_data$Date <="2007-02-02")

#format the date and draw the Global Active Power chart.
datetime <- paste(as.Date(part_data$Date), part_data$Time)
part_data$Datetime <- as.POSIXct(datetime)
plot(part_data$Datetime, part_data$Global_active_power ,type = "l", ylab="Global Active Power(kilowatts)",xlab="")

#Generate PNG file output
dev.copy(png,"plot2.png")
dev.off()