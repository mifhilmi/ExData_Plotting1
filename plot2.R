# read and select the data
raw_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
selected_data <- raw_data[with(raw_data, Date=="1/2/2007" | Date=="2/2/2007"), ]
# DateTime will be used for x-axis in the plot
DateTime <- strptime(paste(selected_data$Date, selected_data$Time), format= "%d/%m/%Y %H:%M:%S")

# plot the data
png('plot2.png', width = 480, height = 480)
with(selected_data, plot(DateTime, Global_active_power,
                         type = "l",
                         xlab = "",
                         ylab = "Global Active Power (killowatts)")) 
dev.off()
