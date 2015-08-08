## make plot 1
Plot3 <- function(fname="household_power_consumption.txt") {
## read file in
	power_tbl <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")

## make column with date and time date objects

	power_tbl[,"PosixTime"] <- as.vector(paste(power_tbl[,1],power_tbl[,2]))
	power_tbl[,1] <- as.Date(as.vector(power_tbl[,1]),format="%d/%m/%Y")
	
## select sample for Feb 01, 2007 and Feb 02,2007

	feb_power_tbl <- power_tbl[((power_tbl[,1] == "2007-02-01") | (power_tbl[,1] == "2007-02-02")),]
	feb_power_tbl[,10] <- as.POSIXct(feb_power_tbl[,10],format ="%d/%m/%Y %H:%M:%S")

## select global active power
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
	
##	write out png file

	dev.copy(png,file="Plot3.png")
##	close graphic device

	dev.off()
}