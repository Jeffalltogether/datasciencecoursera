pollutantmean <- function(directory, pollutant, id = 1:332) {
#        directory = "C:/Users/jeffthatcher/Cloud Drive/CourseERA/2_R_Programming/specdata/"
#        pollutant = "sulfate"
#        id = 1:10
        
        if (pollutant == "sulfate"){
                x = 2
        }
        if (pollutant == "nitrate"){
                x = 3
        } 
        sums = rep(1, length(id))
        vLength = rep(1, length(id))
        for (k in 1:length(id)){
                        position = id[k]
                        fileNum = sprintf("%03d", position)
                        fileName = paste(directory, fileNum, sep = "")
                        fileNameType = paste(fileName, ".csv", sep = "")
                        data <- read.csv(fileNameType)
                        #data <- as.vector(data)
                        xData = data[,x]
                        clData = na.omit(xData)
                        vLength[k] = length(clData)
                        sums[k] = sum(clData)
       }
        storeLength = sum(vLength)
        totalsum = sum(sums)
meanPollutant = totalsum/storeLength
return(meanPollutant)
}
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

