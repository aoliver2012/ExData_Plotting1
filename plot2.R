data <- read.table(file="household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE ,header = TRUE)
data_subset <- subset.data.frame(data, as.Date(data$Date,format="%d/%m/%Y") >= as.Date("02/01/2007",format="%m/%d/%Y") & as.Date(data$Date,format="%d/%m/%Y") <= as.Date("02/02/2007",format="%m/%d/%Y"))
dates <- strptime(as.character(paste(data_subset$Date,data_subset$Time)), format = "%d/%m/%Y %H:%M:%S")
data_subset<-data_subset[,3:9]
data_subset<-data.frame(Date=dates,data_subset)

png(filename="plot2.png")

plot(data_subset$Date,data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()