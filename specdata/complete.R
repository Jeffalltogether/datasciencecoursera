complete <- function(directory, id = 1:332) {
        cvList<-list.files()  
        nobs<-c()
        for (i in 1:length(id)){
                data<-read.csv(cvList[id[i]])
                nobs[i]<-sum(complete.cases(data))
        }
        data.frame(id,nobs)  
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