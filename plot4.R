# plot4 

library(data.table)
rm(list=ls()) #clear WS
setwd("~/GitHub/ExploratoryDataAnalysis/ExData_Plotting1")

#Reads in data from file then subsets data for specified dates
dt_power <- data.table::fread(input = "~/GitHub/ExploratoryDataAnalysis/household_power_consumption.txt"
                             , na.strings="?")

# Prevents Scientific Notation
dt_power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
dt_power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
dt_power <- dt_power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#save plot4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(dt_power[, dateTime], dt_power[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(dt_power[, dateTime],dt_power[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(dt_power[, dateTime], dt_power[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(dt_power[, dateTime], dt_power[, Sub_metering_2], col="red")
lines(dt_power[, dateTime], dt_power[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.6) 

# Plot 4
plot(dt_power[, dateTime], dt_power[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()