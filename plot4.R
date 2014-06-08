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
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2)) # Setup canvas


# 1st figure
x <- data$DateTime
y <- data$Global_active_power
plot(x,y,
     type = "l", 
     col="black", 
     xlab = "",
     ylab = "Global Active Power")
lines(x, y)

# 2nd figure
x2 <- data$DateTime
y2 <- data$Voltage
plot(x2, y2, type = "l", col="black", xlab="", ylab = "Voltage")
lines(x2, y2)

# 3rd figure
plot(data$DateTime,
     data$Sub_metering_1,
     type="l", 
     col="black", 
     xlab="", 
     ylab="Energy Sub Metering")
lines(data$DateTime,data$Sub_metering_1,type = "l", col="black")
lines(data$DateTime,data$Sub_metering_2,type = "l", col="red")
lines(data$DateTime,data$Sub_metering_3,type = "l", col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ), 
       lty=1,  
       col=c("black","red","blue"))


# 4th figure
x4 <- data$DateTime
y4 <- data$Global_reactive_power
plot(x4, y4, type = "l", col="black", xlab="", ylab="Global_reactive_power")
lines(x4, y4)


# Turn off device
dev.off()