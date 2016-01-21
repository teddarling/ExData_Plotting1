getData <- function(){
    tempFile <- "consumption.zip"
    
    #tempFile <- tempfile()
    
    # Download our data from the file mentioned in the project assignment.
    message("Downloading Data")
    download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
        tempFile)
    
    # Unzip the temp file.
    message("Unzip the data file.")
    dataFile <- unzip(tempFile, files=c("household_power_consumption.txt"))
    
    # Delete the zip file.
    unlink(tempFile)
    
    # Find the start and end point of the data that we want to read.
    startLine <- grep("1/2/2007", readLines(dataFile))
    endLine <- grep("3/2/2007", readLines(dataFile))
    
    message("Read rows we want.")
    data <- read.table(
        dataFile, 
        skip = startLine[1] - 1, 
        nrow = endLine[1] - startLine[1], 
        header = FALSE, 
        sep = ";",
        col.names = c(
            "Date", 
            "Time", 
            "Active_power",
            "Reactive_power",
            "Voltage",
            "Intensity",
            "Metering_1",
            "Metering_2",
            "Metering_3"))
    
    # Delete the data file.
    unlink(dataFile)
    
    # Return the data
    data
}
