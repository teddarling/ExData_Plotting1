## Source our helper file.
source('./helper.R')

plot4 <- function(data = NULL){
    ## Get the data if what's passed into the function is null
    if (is.null(data)){
        message("Getting new data")
        
        ## Get our data set from online.
        data = getData()
    }
}