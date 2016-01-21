get_data <- function(){
    tempFile <- "consumption.zip"
    
    # tempFile <- tempfile()
    
    message("Downloading Data")
    download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
        tempFile)
    
    # Unzip the temp file.
    dataFile <- unz(tempFile, "household_power_consumption.txt")
    
    startLine <- grep("1/2/2007", readLines(dataFile))
    endLine <- grep("3/2/2007", readLines(dataFile, startLine))
    
    message("Read rows we want.")
    data <- read.table(dataFile, skip = startLine - 1, nrow = endLine - 1 - startLine, header = FALSE, sep = ";")
    
    #data <- read.table(unz(temp, "household_power_consumption.txt"))
    unlink(tempFile)
    unlink(dataFile)
    
    data
}

