## Source our helper file.
source('./helper.R')

plot3 <- function(data = NULL){
    ## Get the data if what's passed into the function is null
    if (is.null(data)){
        message("Getting new data")
        
        ## Get our data set from online.
        data = getData()
    }
    
    ## Set PNG Values as per instructions in the assignment.
    png("plot3.png", width = 480, height = 480)
    
    ## Create a plot to look similar to plot 3 in the assignment.
    ## This plot uses three sets of data and has a legend.
    with(data, {
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
    })
    
    ## Get off the PNG graphics device.
    dev.off()
}