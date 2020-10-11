# read and select the data
raw_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
selected_data <- raw_data[with(raw_data, Date=="1/2/2007" | Date=="2/2/2007"), ]
# DateTime will be used for x-axis in the plot
DateTime <- strptime(paste(selected_data$Date, selected_data$Time), format= "%d/%m/%Y %H:%M:%S")

# plot the data
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
with(selected_data, {
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") # plot on the top-left
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage") # plot on the top-right
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") # plot on the bottom-left
  lines (x = DateTime, y = Sub_metering_2, col = "red")
  lines (x = DateTime, y = Sub_metering_3, col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lwd = 1,
         bty = "n")
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") # plot on the bottom-right
}) 
dev.off()
