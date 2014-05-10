plot1<-function(){
  require("sqldf")
  tfile <- "./data/household_power_consumption.txt"
  tsql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  ##Read data for only Feb 1 and Feb 2 2007.
  data <- read.csv.sql(tfile, tsql, sep=";")
  
  ##Get the Global Active Power column and convert it into numeric to facilitate plotting.
  x<-as.numeric(data[,3])
  
  ##Plot the x label, title and red color histogram for Global_Active_Power
  hist(x,col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
  
  ##Copy the plot generated on the screen device to plot1.png
  dev.copy(png,"./ExData_Plotting1/plot1.png",width=480, height=480)
  
  ##close the device.
  dev.off()
}