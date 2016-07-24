plot3 <- function(filepath){# file path as argument of the function. Give the correct filepath to read this file. In my code this file is stored in working directory.

epc <- data.frame(read.table(filepath,sep = ";",header= TRUE),stringAsFactor=FALSE)
epc2 <- subset(epc,as.Date(Date, "%d/%m/%Y")== "2007-02-01" | as.Date(Date, "%d/%m/%Y")== "2007-02-02")   # select the data for two days: "2007-02-01"and "2007-02-02" 


date <- paste(as.Date(epc2$Date, "%d/%m/%Y"),epc2$Time)

time <- strptime(date,"%Y-%m-%d %H:%M:%S")


png(filename = "plot3.png", width = 480, height = 480)	# open the png device

plot(time,as.numeric(as.character(epc2$Sub_metering_1)),type="l",xlab = "", ylab="Energy Sub metering") #plot in png device 

lines(time,as.numeric(as.character(epc2$Sub_metering_3)),type="l",col = "blue") 	#add second plot
lines(time,as.numeric(as.character(epc2$Sub_metering_2)),type="l",col = "red")	#add third plot

legend("topright",col =c("black","red","blue"),legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty=1)	#put legend



dev.off()		# turn off the png device and store the plot as png file


}
