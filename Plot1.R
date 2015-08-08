## make plot 1
Plot1 <- function(fname="household_power_consumption.txt") {
## read file in

	power_tbl <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")

## make column with date and time date objects

	power_tbl[,1] <- as.Date(as.vector(power_tbl[,1]),format="%d/%m/%Y")
	
## select sample for Feb 01, 2007 and Feb 02,2007

	feb_power_tbl <- power_tbl[((power_tbl[,1] == "2007-02-01") | (power_tbl[,1] == "2007-02-02")),]

## select global active power

	global_active_power <- feb_power_tbl[,3]

## plot required histogram

	hist(global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
	
##	write out png file

	dev.copy(png,file="Plot1.png")
##	close graphic device

	dev.off()
}