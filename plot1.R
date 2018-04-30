# plot1 

library(data.table)
rm(list=ls()) #clear WS
setwd("~/GitHub/ExploratoryDataAnalysis/ExData_Plotting1")

#first, reads in data from file then subsets data for specified dates
dt_power <- data.table::fread(input = "~/GitHub/ExploratoryDataAnalysis/household_power_consumption.txt"
                             , na.strings="?")

# Prevents histogram from printing in scientific notation
dt_power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type (we can also use strptime())
dt_power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
dt_power <- dt_power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# save the into png file
png("plot1.png", width=480, height=480)

## Plot 1
hist(dt_power[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()