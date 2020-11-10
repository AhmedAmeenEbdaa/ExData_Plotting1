readDataset <- function(){
	myData <- read.table("household_power_consumption.txt",sep =";",header = FALSE,  dec = ".",na.strings = "NA",skip = 66637 ,nrow =2878 )
	tableNames <- readColumnNames()
	names(myData) <- tableNames
	png("plot3.png",height = 480 , width = 480)
	myData <- transform(myData, date_time = paste0(Date,Time))
    plot(strptime(myData$date_time,"%d/%m/%Y  %H:%M:%S"),myData$Sub_metering_1,type="n",xlab="Date",ylab="Energy sub metering")
    lines(strptime(myData$date_time,"%d/%m/%Y  %H:%M:%S"),myData$Sub_metering_1)
    lines(strptime(myData$date_time,"%d/%m/%Y  %H:%M:%S"),myData$Sub_metering_2, col = "red")
    lines(strptime(myData$date_time,"%d/%m/%Y  %H:%M:%S"),myData$Sub_metering_3, col = "blue")
	legend("topright",col=c("black","red", "blue"),lty=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
}

readColumnNames <- function(){
	tableNames <-  names(read.table("household_power_consumption.txt",sep =";",header = TRUE,nrow =1 ))
	tableNames
}