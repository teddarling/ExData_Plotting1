## Source our helper file.
source('./helper.R')

plot2 <- function(data = NULL){
    ## Get the data if what's passed into the function is null
    if (is.null(data)){
        message("Getting new data")
        
        ## Get our data set from online.
        data = getData()
    }
    
    ## Set PNG Values as per instructions in the assignment.
    png("plot2.png", width = 480, height = 480)
    
    ## Create a histograph to look similar to plot 1 in the assignment.
    plot(
        data$DateTime, 
        data$Global_active_power, 
        type = "l", 
        xlab = "", 
        ylab = "Global Active Power (kilowatts)")

    
    ## Get off the PNG graphics device.
    dev.off()
}