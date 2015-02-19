#corr <- function(directory, threshold = 0) {
        Threshold = 5        
        corDataS = rep(1, length(id))
        corDataN = rep(1, length(id))
        for (k in 1:length(id)){
                position = id[k]
                fileNum = sprintf("%03d", position)
                fileName = paste(directory, fileNum, sep = "")
                fileNameType = paste(fileName, ".csv", sep = "")
                data <- read.csv(fileNameType)
                clData=na.omit(data)
                if (nrow(clData) >= threshold){
                        
                }
                corData[k] = clData[,sulfate, nitrate]
        }
        cCoeff <- data.frame(fileId, nobs)
        return(cCoeff)
#}        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
