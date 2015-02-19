pollutantmean <- function(directory, pollutant, id = 1:332) {
        id = 1:99
        Values = rep(1, length(id))
        for (d in id){
                position = id[d]
                fileNum = sprintf("%03d", position)
                fileName = paste(directory, fileNum, sep = "")
                fileNameType = paste(x, ".csv", sep = "")
                data <- read.csv(fileNameType)
                clData=na.omit(data)
                Ave = mean(clData[,pollutant])
                Values[position] = Ave
        }
        meanPollutant = mean(Values)
        return(meanPollutant)
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
}