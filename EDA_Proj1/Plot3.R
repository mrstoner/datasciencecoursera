
##Read in the entire data set
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Create a new column that contains date objects
x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

##Define start and end dates, then subset the larger data set
startdate <- as.POSIXct("2007-2-1 00:00:00", format="%Y-%m-%d %H:%M:%S")
enddate <- as.POSIXct("2007-2-2 23:59:59", format="%Y-%m-%d %H:%M:%S")
twodays <- x[x$DateTime %in% startdate:enddate,]


##Make the submetering plot
png(filename = "plot3.png")
plot.new()
with(twodays, {
    plot(DateTime, Sub_metering_1,
                   type = "l", 
                   xlab = "", 
                   ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "blue", "red"), 
            legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
            lty = "solid")
    })
dev.off()

