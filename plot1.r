#Read data from files and make proper format.
full_data <- read.csv("household_power_consumption.txt",sep=';', header=T,na.strings="?",stringsAsFactors = F)
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")
part_data <- subset(full_data, full_data$Date>="2007-02-01" & full_data$Date <="2007-02-02")


#Draw the history chart for Global Active Power
hist(as.numeric(part_data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

#Generate PNG file output
dev.copy(png,"plot1.png")
dev.off()