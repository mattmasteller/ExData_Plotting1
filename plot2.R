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

# Create timeseries plot
png(file="plot2.png", width=480, height=480)
plot(data$DateTime,
     as.numeric(data$Global_active_power), 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()