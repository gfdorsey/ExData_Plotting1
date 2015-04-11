## Coursera / Johns Hopkins
## Data Science
## 04 Exploratory Data Analysis
##
## George F. Dorsey, Jr.
##
## Project 1, Plot 3

## Create Data ####
## Time zone unknown--treat dates as GMT for the sake of consistency when
## comparing dates and to avoid warning messages

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- as.POSIXct(paste(data$Date, data$Time), tz ="GMT", format = "%Y-%m-%d %H:%M:%S")

startDate = as.Date("2007-02-01", tz = "GMT", format = "%Y-%m-%d")
endDate = as.Date("2007-02-03", tz = "GMT", format = "%Y-%m-%d")
data <- subset(data, Date >= startDate & Date < endDate)


## Plot to plot3.png File ####
## Reference plot has no title or x-axis label, so none is included here

png(filename = "plot3.png", width = 480, height = 480)
plot(data$Time, data$Sub_metering_1, type='l', main = "",
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = 1, legend = 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
