## make plot 1
Plot2 <- function(fname="household_power_consumption.txt") {
## read file in

	power_tbl <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")

## make column with date and time date objects

	power_tbl[,"PosixTime"] <- as.vector(paste(power_tbl[,1],power_tbl[,2]))
	power_tbl[,1] <- as.Date(as.vector(power_tbl[,1]),format="%d/%m/%Y")
	
## select sample for Feb 01, 2007 and Feb 02,2007

	feb_power_tbl <- power_tbl[((power_tbl[,1] == "2007-02-01") | (power_tbl[,1] == "2007-02-02")),]
	feb_power_tbl[,10] <- as.POSIXct(feb_power_tbl[,10],format ="%d/%m/%Y %H:%M:%S")

## select global active power
	work_col <- c(10,3)
	global_active_power <- feb_power_tbl[,work_col]

## plot required line graph

	plot(global_active_power,main="Global Active Power",ylab="Global Active Power (kilowatts)",type="l")
	
##	write out png file

	dev.copy(png,file="Plot2.png")
##	close graphic device

	dev.off()
}