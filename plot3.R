plot3<-function(){
  require("sqldf")
  tfile <- "./data/household_power_consumption.txt"
  tsql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  ##Read data for only Feb 1 and Feb 2 2007.
  data <- read.csv.sql(tfile, tsql, sep=";")
  
  ##Get the weekdays for the dataset
  wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
  
  #Start png device 
  png("./ExData_Plotting1/plot3.png",width=480, height=480)
 
  ##Plot the graph
  with(data,plot(wDays,data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy Sub metering"))
  lines(wDays,data$Sub_metering_2,col="red")
  lines(wDays,data$Sub_metering_3,col="blue")
  
  ##Fix Legends
  legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  ##close the device.
  dev.off()

}
