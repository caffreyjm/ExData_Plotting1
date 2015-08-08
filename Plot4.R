## make plot 1
Plot4 <- function(fname="household_power_consumption.txt") {
## read file in
	power_tbl <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")

## make column with date and time date objects

	power_tbl[,"date_time"] <- as.vector(paste(power_tbl[,1],power_tbl[,2]))
	power_tbl[,1] <- as.Date(as.vector(power_tbl[,1]),format="%d/%m/%Y")
	
## select sample for Feb 01, 2007 and Feb 02,2007

	feb_power_tbl <- power_tbl[((power_tbl[,1] == "2007-02-01") | (power_tbl[,1] == "2007-02-02")),]
	feb_power_tbl[,10] <- as.POSIXct(feb_power_tbl[,10],format ="%d/%m/%Y %H:%M:%S")

##	set columns (2x2)

	par(mfcol=c(2,2))
	
## select global active power
	work_col <- c(10,3)
	global_active_power <- feb_power_tbl[,work_col]

## plot required line graph

	plot(global_active_power,ylab="Global Active Power",xlab="",type="l")
	
	
## select sub meteromg power
	work_col <- c(10,7)
	submeter_1 <- feb_power_tbl[,work_col]
	work_col <- c(10,8)
	submeter_2 <- feb_power_tbl[,work_col]
	work_col <- c(10,9)
	submeter_3 <- feb_power_tbl[,work_col]

## plot required line graph

	plot(submeter_1,ylab="Energy Sub Metering",xlab="",type="l")
	lines(submeter_2,type="l",col="red")
	lines(submeter_3,type="l",col="blue")
	legend("topright",pch="-",col= c("black","red","blue"),legend = c("sub metering 1","sub metering 2", "sub metering 3"),)

## select voltage 
	work_col <- c(10,5)
	feb_voltage <- feb_power_tbl[,work_col]

## plot required line graph

	plot(feb_voltage,ylab="Voltage",type="l")
	
## select reactive power
	work_col <- c(10,4)
	feb_reactive_power <- feb_power_tbl[,work_col]

## plot required line graph

	plot(feb_reactive_power,ylab="Reactive Power",type="l")	
	
##	write out png file

	dev.copy(png,file="Plot4.png")
##	close graphic device

	dev.off()
}