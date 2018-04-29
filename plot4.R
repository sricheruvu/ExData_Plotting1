# plot4 

library(data.table)

rm(list=ls()) #clear WS

## Read the dataset
dPConsumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(dPConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 	
subsetDP <- subset(dPConsumption,dPConsumption$Date=="1/2/2007" | dPConsumption$Date =="2/2/2007")  
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subsetDP$Date <- as.Date(subsetDP$Date, format="%d/%m/%Y")
subsetDP$Time <- strptime(subsetDP$Time, format="%H:%M:%S")
subsetDP[1:1440,"Time"] <- format(subsetDP[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetDP[1441:2880,"Time"] <- format(subsetDP[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))
# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subsetDP,{
  plot(subsetDP$Time,as.numeric(as.character(subsetDP$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subsetDP$Time,as.numeric(as.character(subsetDP$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subsetDP$Time,subsetDP$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subsetDP,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subsetDP,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subsetDP,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.25)
  # legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,lty = 1,col = c("black","red","blue"))
  
  plot(subsetDP$Time,as.numeric(as.character(subsetDP$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png, file = "C:/Users/Niyati/Documents/GitHub/ExploratoryDataAnalysis/ExData_Plotting1/plot4.png") 
dev.off()