# plot1 

library(data.table)
rm(list=ls()) #clear WS

# Initialization of the processed data table
hpc_test=read.table("household_power_consumption.txt",nrows = 30 , header=TRUE, sep = ";")
hpc=read.table("household_power_consumption.txt",skip = 66637,nrows = 2880 , header=TRUE, sep = ";")
names(hpc)= names(hpc_test)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

hist(hpc$Global_active_power, xlab="Global Active Power (kilowatts)",main = "Global Active Power", col="red")
dev.print(png, "plot1.png", width=480, height=480)
dev.copy(png, file = "C:/Users/Niyati/Documents/GitHub/ExploratoryDataAnalysis/ExData_Plotting1/plot1.png") 
dev.off()