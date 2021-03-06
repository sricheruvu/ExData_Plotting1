# plot2 

library(data.table)
rm(list=ls()) #clear WS
setwd("~/GitHub/ExploratoryDataAnalysis/ExData_Plotting1")


#Reads in data from file then subsets data for specified dates
dt_power <- data.table::fread(input = "~/GitHub/ExploratoryDataAnalysis/household_power_consumption.txt"
                             , na.strings="?")

# Prevents histogram from printing in scientific notation
dt_power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
dt_power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
dt_power <- dt_power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# save plot2
png("plot2.png", width=480, height=480)

## Plot 2
plot(x = dt_power[, dateTime]
     , y = dt_power[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()