
##Read in the entire data set
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Create a new column that contains date objects
x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

##Define start and end dates, then subset the larger data set
startdate <- as.POSIXct("2007-2-1 00:00:00", format="%Y-%m-%d %H:%M:%S")
enddate <- as.POSIXct("2007-2-2 23:59:59", format="%Y-%m-%d %H:%M:%S")
twodays <- x[x$DateTime %in% startdate:enddate,]

##Make the histogram
png(filename = "plot1.png")
hist(twodays$Global_active_power, col = "red", 
        xlab = "Global Active Power (kilowatts)",
        main = "Global Active Power")
dev.off()

