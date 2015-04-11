## Coursera / Johns Hopkins
## Data Science
## 04 Exploratory Data Analysis
##
## George F. Dorsey, Jr.
##
## Project 1, Plot 2

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


## Plot to plot2.png File ####
## Reference plot has no title or x-axis label, so none is included here

png(filename = "plot2.png", width = 480, height = 480)
plot(data$Time, data$Global_active_power, type='l', main = "",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
