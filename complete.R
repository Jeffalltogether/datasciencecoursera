complete <- function(directory, id = 1:332) {
        nobs = rep(1, length(id))
        fileId = rep(1, length(id))
        for (k in 1:length(id)){
                position = id[k]
                fileNum = sprintf("%03d", position)
                fileName = paste(directory, fileNum, sep = "")
                fileNameType = paste(fileName, ".csv", sep = "")
                data <- read.csv(fileNameType)
                clData=na.omit(data)
                fileId[k] = fileNum
                nobs[k] = nrow(clData)
                
        }
        rtable <- data.frame(fileId, nobs)
        return(rtable)
}
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases