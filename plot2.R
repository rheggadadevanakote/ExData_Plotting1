plot2<-function(){
  require("sqldf")
  tfile <- "./data/household_power_consumption.txt"
  tsql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  ##Read data for only Feb 1 and Feb 2 2007.
  data <- read.csv.sql(tfile, tsql, sep=";")
  
  ##Get the weekdays for the dataset
  wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
  
  ## Plot weekdays on the x-axis and Global Active power on the y axis
  plot(wDays, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  ##Copy the plot generated on the screen device to plot1.png
  dev.copy(png,"./ExData_Plotting1/plot2.png",width=480, height=480)
  
  ##close the device.
  dev.off()
  
}