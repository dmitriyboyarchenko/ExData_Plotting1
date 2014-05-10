## NOTE: this script assumes that the data provided with the assignment is in
## the file household_power_consumption.txt in the current working directory
## (and that the file has not been modified in any way)

# Read the relevant rows from the table in the given text file
epc.data <- read.table("./household_power_consumption.txt",
                 sep=";",
                 skip=66637,
                 nrow=2880,
                 colClasses=c("character", "character", rep(c("numeric"), 7)))

# Assign correct names to all the columns
colnames(epc.data) <- c("Date",
                        "Time",
                        "Global_active_power",
                        "Global_reactive_power",
                        "Voltage",
                        "Global_intensity",
                        "Sub_metering_1",
                        "Sub_metering_2",
                        "Sub_metering_3")

# Convert the time column into the correct format
epc.data$Time <- strptime(paste(epc.data$Date, epc.data$Time),
                          format="%d/%m/%Y %H:%M:%S")

# Convert the date column into the correct format
epc.data$Date <- as.Date(epc.data$Date, format="%d/%m/%Y")

# Save the histogram of the Global Active Power
# as a PNG file in the required format
png(filename="./plot1.png",
    width=480,
    height=480)
hist(epc.data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()