corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  list<-list.files()
  good<-complete(directory) # calcute number of complete cases
  thre<-subset(good,nobs>threshold) 
  id<-thre$id
  corrnum<-c()
  for (i in id){
    x<-read.csv(list[i])
    temp<-cor(x$nitrate,x$sulfate, use="na.or.complete")
    corrnum<-c(corrnum,temp)
  } 
  corrnum
}