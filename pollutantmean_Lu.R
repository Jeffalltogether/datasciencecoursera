pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  list<-list.files()
  target<-c()
  id = 4:300
  pollutant = "nitrate"
  for (i in id){
    x<-read.csv(list[i])
    data<-x[pollutant]
    good<-data[!is.na(data)]
    target<-c(target,good) #concatenates "good" data into 'target' vector and then appends new data to the end.
}
mean(target)
}