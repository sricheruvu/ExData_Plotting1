# plot3 

library(data.table)
rm(list=ls()) #clear WS

# Initialization of the processed data table
hpc_test=read.table("household_power_consumption.txt",nrows = 30 , header=TRUE, sep = ";")
hpc=read.table("household_power_consumption.txt",skip = 66637,nrows = 2880 , header=TRUE, sep = ";")
names(hpc)= names(hpc_test)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

with(hpc,plot(DateTime,Sub_metering_1,ylab="Energy sub metering",type="l",xlab="", col="black"))
lines(hpc$DateTime,hpc$Sub_metering_2,type="l",col="red")
lines(hpc$DateTime,hpc$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,lty = c(1,1,1),col = c("black","red","blue"))

dev.print(png, "plot3.png", width=480, height=480)
dev.copy(png, file = "C:/Users/Niyati/Documents/GitHub/ExploratoryDataAnalysis/ExData_Plotting1/plot3.png") 
dev.off()