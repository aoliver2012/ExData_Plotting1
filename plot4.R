data <- read.table(file="household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE ,header = TRUE)
data_subset <- subset.data.frame(data, as.Date(data$Date,format="%d/%m/%Y") >= as.Date("02/01/2007",format="%m/%d/%Y") & as.Date(data$Date,format="%d/%m/%Y") <= as.Date("02/02/2007",format="%m/%d/%Y"))
dates <- strptime(as.character(paste(data_subset$Date,data_subset$Time)), format = "%d/%m/%Y %H:%M:%S")
data_subset<-data_subset[,3:9]
data_subset<-data.frame(Date=dates,data_subset)

png(filename="plot4.png")
par(mfrow=c(2,2))

plot(data_subset$Date,data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(data_subset$Date,data_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data_subset$Date,data_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(data_subset$Date,data_subset$Sub_metering_2, type="l", col="red")
points(data_subset$Date,data_subset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1,1), col=c("black","red","blue"))

plot(data_subset$Date,data_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()