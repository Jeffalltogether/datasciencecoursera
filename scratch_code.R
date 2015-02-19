
readings = rep(1, length(storeLength))
for (k in 1:length(id)){
        k=5
        position = id[k]
        fileNum = sprintf("%03d", position)
        fileName = paste(directory, fileNum, sep = "")
        fileNameType = paste(fileName, ".csv", sep = "")
        data <- read.csv(fileNameType)
        #data <- as.vector(data)
        xData = data[,x]
       
        clData = na.omit(xData)
        if (k == 1) {
                for (d in 1:vLength[k]){ 
                        storeLength[d] = clData[d]
                }
        }
        if (k >= 2) {
                for (d in vLength[k-1]:vLength[k]){
                        storeLength[d] = clData[d]
                }
        }
}
meanPollutant = mean(storeLength)
return(meanPollutant)
}