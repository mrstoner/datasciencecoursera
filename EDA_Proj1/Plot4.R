
##Read in the entire data set
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Create a new column that contains date objects
x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

##Define start and end dates, then subset the larger data set
startdate <- as.POSIXct("2007-2-1 00:00:00", format="%Y-%m-%d %H:%M:%S")
enddate <- as.POSIXct("2007-2-2 23:59:59", format="%Y-%m-%d %H:%M:%S")
twodays <- x[x$DateTime %in% startdate:enddate,]

##make the plot
png(filename = "plot4.png")
plot.new()
##set up the frame
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(6, 2, 2, 0), bg = "transparent") 
with(twodays, {
    ## make the first plot
    plot(DateTime, Global_active_power, 
         type = "l", 
         xlab = "", 
         ylab = "Global Active Power")
    lines(DateTime, Global_active_power)

    ## make the second plot
    plot(DateTime, Voltage, 
         type = "l", 
         xlab = "")
    lines(DateTime, Voltage)
    title(xlab = "datetime", ylab = "Voltage")
    
    ## make the third plot
    plot(DateTime, Sub_metering_1,
         type = "l", 
         xlab = "", 
         ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "blue", "red"), 
           legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = "solid",
           cex = 0.8)
    
    ## make the fourth plot
    plot(DateTime, Global_reactive_power, 
         type = "l", 
         xlab = "datetime", 
         ylab = "Global_reactive_power")
    lines(DateTime, Global_reactive_power)
    
    })
dev.off() ## close the PNG device