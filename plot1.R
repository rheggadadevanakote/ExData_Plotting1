plot1<-function(){
  require("sqldf")
  tfile <- "./data/household_power_consumption.txt"
  tsql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  data <- read.csv.sql(tfile, tsql, sep=";")
  x<-as.numeric(data[,3])
  hist(x,col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
}