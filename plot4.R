## Source our helper file.
source('./helper.R')

plot4 <- function(data = NULL){
    ## Get the data if what's passed into the function is null
    if (is.null(data)){
        message("Getting new data")
        
        ## Get our data set from online.
        data = getData()
    }
    
    ## Set PNG Values as per instructions in the assignment.
    png("plot4.png", width = 480, height = 480)
    
    ## Create a plot to look similar to plot 2 in the assignment.
    with(data, {
        ## Setup for plotting 4 charts.
        par(mfcol = c(2, 2))
        
        ## Plot the first chart. This is the same that plot2.R creates.
        plot(
            data$DateTime, 
            data$Global_active_power, 
            type = "l", 
            xlab = "", 
            ylab = "Global Active Power (kilowatts)")
        
        
        ## Plot the second chart. This is the same that plot3.R creates.
        plot(
            DateTime, 
            Sub_metering_1, 
            type = "n", 
            xlab = "", 
            ylab = "Energy sub metering")
        
        ## Add a legend for the sub meterings
        legend("topright", 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col = c("black", "red", "blue"), 
               lty = c(1, 1, 1))
        
        ## Add the three sets of points to the plot.
        points(DateTime, Sub_metering_1, type="l")
        points(DateTime, Sub_metering_2, type="l", col = "red")
        points(DateTime, Sub_metering_3, type="l", col = "blue")
        
        ## Add the third plot
        plot(
            DateTime, 
            Voltage, 
            type = "l", 
            xlab = "datetime", 
            ylab = "Voltage")
        
        ## Add the third plot
        plot(
            DateTime, 
            Global_reactive_power, 
            type = "l", 
            xlab = "datetime", 
            ylab = "Global_reactive_power")
    })
    
    
    ## Get off the PNG graphics device.
    dev.off()
}