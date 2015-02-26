### Assignment 2

## Playing with given functions

setwd("C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience")
source("makeCacheVector.R")
source("cacheSolveV.R")

a <- makeVector(c(1,2,3,4,5))
a$get()
a$getmean()
cachemean(a)
a$getmean()  # this is only to show you that the mean has been stored and does not affect anything
cachemean(a)
a$set(c(10,20,30,40))
a$getmean()
cachemean(a)
cachemean(a)
a$get()
a$setmean(0)  # do NOT call setmean() directly despite it being accessible for the reason you will see next
a$getmean()
a$get()
cachemean(a)
a <- makeVector(c(5, 25, 125, 625))
a$get()
cachemean(a)
cachemean(a)


## Using Solve
x <- matrix(rnorm(25),nrow = 5,ncol = 5)
solve(x)

## Generating matrix and inverse matrix functions
setwd("C:/Users/jeffthatcher/Cloud Drive/RRepos")
source("cacheMatrix.R")


a <- makeCacheMatrix(matrix(runif(4,1,50),2,2))
a$get()
a$getinverse()
cacheSolve(a)
a$getinverse()  # this is only to show you that the mean has been stored and does not affect anything
cacheSolve(a)
