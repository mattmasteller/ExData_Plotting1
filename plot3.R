# Get raw data
data <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep = ";", 
                      na.strings = "?",
                      stringsAsFactors = FALSE)

# Filter data by date (1/2/2007 and 2/2/2007)
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Add DateTime column
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Create plot
png(file="plot3.png", width=480, height=480)
par(mfrow=c(1,1)) # Setup canvas
plot(data$DateTime, 
     data$Sub_metering_1, 
     type="n", 
     xlab="",
     ylab="Energy sub metering") # Doesn't actaully plot the data

# Add the lines
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

# Create the legend
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), 
       col=c("black","red", "blue")) 

# Turn off device
dev.off()