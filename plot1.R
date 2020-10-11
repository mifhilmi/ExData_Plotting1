# read and select the data
raw_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")
selected_data <- subset(raw_data, Date == "2007-02-01" | Date == "2007-02-02")$Global_active_power

# plot the data
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(selected_data)), 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
