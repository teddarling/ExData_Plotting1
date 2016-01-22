## Download the data file expected for the class from
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## See README.md for info about where the dataset is located.
##
## After downloading the file, get only the data from the dates
## 2007-02-01 and 2007-02-02 as per the section "Loading the data" in README.md
getData <- function(){
    ## This file just makes seeing things happen easier than trying
    ## to determine where in a temp folder the real code is working.
    #tempFile <- "consumption.zip"
    
    tempFile <- tempfile()
    
    ## Download our data from the file mentioned in the project assignment.
    message("Downloading Data")
    download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
        tempFile)
    
    ## Unzip the temp file.
    message("Unzip the data file.")
    dataFile <- unzip(tempFile, files=c("household_power_consumption.txt"))
    
    ## Delete the zip file.
    unlink(tempFile)
    
    ## Find the start and end point of the data that we want to read.
    startLine <- grep("1/2/2007", readLines(dataFile))
    endLine <- grep("3/2/2007", readLines(dataFile))
    
    ## Handle the formatting of dates.
    setClass("dataDate")
    setAs("character","dataDate", function(from) as.Date(from, format="%d/%m/%Y"))
    
    
    ## Read the data for the rows where data is 2007-02-01 and 2007-02-02.
    message("Read rows we want.")
    data <- read.table(
        dataFile, 
        skip = startLine[1] - 1, 
        nrow = endLine[1] - startLine[1], 
        header = FALSE, 
        sep = ";",
        na.strings = c("?"),
        col.names = c(
            "Date", 
            "Time", 
            "Global_active_power",
            "Global_reactive_power",
            "Voltage",
            "Global_intensity",
            "Sub_metering_1",
            "Sub_metering_2",
            "Sub_metering_3"),
        colClasses = c(
            "dataDate", 
            "character", 
            "numeric", 
            "numeric", 
            "numeric", 
            "numeric", 
            "numeric", 
            "numeric", 
            "numeric"))
    
    ## Delete the data file.
    unlink(dataFile)
    
    ## Combine Date And Time columns to create a DateTime 
    ## column with no timezone offset.
    data$DateTime <- 
        as.POSIXct(strptime(
            paste(data$Date, data$Tim), 
            format = "%Y-%m-%d %H:%M:%S"))
    
    ## Return the data
    data
}
