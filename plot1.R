# Get raw data
dataRaw <- read.table("household_power_consumption.txt", 
                    header = TRUE, 
                    sep = ";", 
                    na.strings = "?",
                    stringsAsFactors = FALSE)

# Filter data for 1/2/2007 and 2/2/2007
dataFiltered <- dataRaw[dataRaw$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create histogram
png(file="plot1.png", width=480, height=480)
hist(as.numeric(dataFiltered$Global_active_power), 
        col="red", 
        main="Global Active Power", 
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency")
dev.off()