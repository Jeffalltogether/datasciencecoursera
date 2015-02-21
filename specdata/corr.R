corr <- function(directory, threshold = 0) {

  cvList<-list.files()
  completeData<-complete(directory) # calcute number of complete cases
  thresh<-subset(completeData,nobs>threshold) 
  id<-thresh$id
  finalData<-c()
  for (i in id){
    x<-read.csv(cvList[i])
    cordata<-cor(x$nitrate,x$sulfate, use="na.or.complete")
    finalData<-c(finalData,cordata)
  } 
  finalData
}

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations