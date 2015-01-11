data <- read.table(file="household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE ,header = TRUE)
data_subset <- subset.data.frame(data, as.Date(data$Date,format="%d/%m/%Y") >= as.Date("02/01/2007",format="%m/%d/%Y") & as.Date(data$Date,format="%d/%m/%Y") <= as.Date("02/02/2007",format="%m/%d/%Y"))
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

png(filename="plot1.png")

hist(data_subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()