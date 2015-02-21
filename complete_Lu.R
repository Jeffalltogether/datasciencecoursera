complete <- function(directory, id = 1:332) {
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
  nobs<-0
  list<-list.files()
  for (i in 1:length(id)){
    x<-read.csv(list[id[i]])
    nobs[i]<-sum(complete.cases(x))
  }
  data.frame(id,nobs)  
}