plot4 <- function(filepath){	# file path as argument of the function. Give the correct filepath to read this file. In my code this file is stored in working directory.


epc <- data.frame(read.table(filepath,sep = ";",header= TRUE),stringAsFactor=FALSE)
epc2 <- subset(epc,as.Date(Date, "%d/%m/%Y")== "2007-02-01" | as.Date(Date, "%d/%m/%Y")== "2007-02-02")	# select the data for two days: "2007-02-01"and "2007-02-02" 

date <- paste(as.Date(epc2$Date, "%d/%m/%Y"),epc2$Time)

time <- strptime(date,"%Y-%m-%d %H:%M:%S")


png(filename = "plot4.png", width = 480, height = 480) 	# open the png device

par(mfrow = c(2,2))	# make the plot frame to have 4 graphs arranged in two rows and two columns.

plot(time,as.numeric(as.character(epc2$Global_active_power)),xlab="",ylab="Global Active Power",type = "l") 	#plot in the png device 

plot(time,as.numeric(as.character(epc2$Voltage)),xlab = "Datetime",ylab = "Voltage",type = "l") 	#plot the second graph in the png device 

plot(time,as.numeric(as.character(epc2$Sub_metering_1)),type="l",xlab = "", ylab="Energy Sub metering") # plot the 3rd graph
lines(time,as.numeric(as.character(epc2$Sub_metering_3)),type="l",col = "blue")
lines(time,as.numeric(as.character(epc2$Sub_metering_2)),type="l",col = "red")
legend("topright",col =c("black","red","blue"),legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty=1)


plot(time,as.numeric(as.character(epc2$Global_reactive_power)),xlab = "Datetime",ylab = "Global Reactive Power",type="l")# plot the last graph

dev.off()  # turn off the png device and store the plot as png file

}

 

 


											

