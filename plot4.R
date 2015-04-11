## Coursera / Johns Hopkins
## Data Science
## 04 Exploratory Data Analysis
##
## George F. Dorsey, Jr.
##
## Project 1, Plot 4

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


## Plot to plot4.png File ####

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,4,2), cex = 0.8)

## top left
plot(data$Time, data$Global_active_power, type='l', main = "",
     xlab = "", ylab = "Global Active Power")

## top right
plot(data$Time, data$Voltage, type = 'l', main = "",
     xlab = "datetime", ylab = "Voltage")

## bottom left
plot(data$Time, data$Sub_metering_1, type='l', main = "",
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = 1, legend = 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = 'n')


## bottom right
plot(data$Time, data$Global_reactive_power, type = 'l', main = "",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

