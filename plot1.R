readDataset <- function(){
	myData <- read.table("household_power_consumption.txt",sep =";",header = FALSE,  dec = ".",na.strings = "NA",skip = 66637 ,nrow =2878 )
	tableNames <- readColumnNames()
	names(myData) <- tableNames
	png("plot1.png",height = 480 , width = 480)
	hist(myData$Global_active_power,col = "red", ylim = c(0 ,1200),xlim = c(0,6),main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
    dev.off()
}

readColumnNames <- function(){
	tableNames <-  names(read.table("household_power_consumption.txt",sep =";",header = TRUE,nrow =1 ))
	tableNames
}