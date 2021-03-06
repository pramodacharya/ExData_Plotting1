plot2 <- function(filepath){# file path as argument of the function. Give the correct filepath to read this file. In my code this file is stored in working directory.


epc <- data.frame(read.table(filepath,sep = ";",header= TRUE),stringAsFactor=FALSE) # read the data from the file

epc2 <- subset(epc,as.Date(Date, "%d/%m/%Y")== "2007-02-01" | as.Date(Date, "%d/%m/%Y")== "2007-02-02") # select the data for two days: "2007-02-01"and "2007-02-02" 


date <- paste(as.Date(epc2$Date, "%d/%m/%Y"),epc2$Time)

time <- strptime(date,"%Y-%m-%d %H:%M:%S")


png(filename = "plot2.png", width = 480, height = 480)    # open the png device

plot(time,as.numeric(as.character(epc2$Global_active_power)),xlab="",ylab = "Global Active Power(killowatts)",type ="l" )	#plot in png device 

dev.off()   	# turn off the png device and store the plot as png file

}


