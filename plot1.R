## Source our helper file.
source('./helper.R')

plot1 <- function(data = NULL){
    ## Get the data if what's passed into the function is null
    if (is.null(data)){
        message("Getting new data")
        
        ## Get our data set from online.
        data = getData()
    }
    
    ## Set PNG Values as per instructions in the assignment.
    png("plot1.png", width = 480, height = 480)
    
    ## Create a histograph to look similar to plot 1 in the assignment.
    hist(data8$Active_power, 
         col = "red", 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", 
         ylab = "Frequency")

}