readDataset <- function(){
	myData <- read.table("household_power_consumption.txt",sep =";",header = FALSE,  dec = ".",na.strings = "NA",skip = 66637 ,nrow =2878 )
	tableNames <- readColumnNames()
	names(myData) <- tableNames
	png("plot2.png",height = 480 , width = 480)
	myData <- transform(myData, date_time = paste0(Date,Time))
	plot(strptime(myData$date_time,"%d/%m/%Y  %H:%M:%S"),myData$Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")
    dev.off()
}

readColumnNames <- function(){
	tableNames <-  names(read.table("household_power_consumption.txt",sep =";",header = TRUE,nrow =1 ))
	tableNames
}