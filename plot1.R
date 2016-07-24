plot1 <- function(filepath){ # file path as argument of the function

filepath <- "household_power_consumption.txt" # give the correct filepath to read this file. In my code this file is stored in working directory.

epc <- data.frame(read.table(filepath,sep = ";",header= TRUE),stringAsFactor=FALSE) # read the data from the file

epc2 <- subset(epc,as.Date(Date, "%d/%m/%Y")== "2007-02-01" | as.Date(Date, "%d/%m/%Y")== "2007-02-02") # select the data for two days: "2007-02-01"and "2007-02-02" 

png(filename = "plot1.png", width = 480, height = 480) # open the png device

hist(as.numeric(as.character(epc2$Global_active_power)),col = "red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
												#plot histogram in png device 

dev.off() # turn off the png device and store the plot as png file

}