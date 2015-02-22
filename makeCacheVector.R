### Assignment 2

# The first function, makeVector creates a special "vector", which is really a 
# list containing a function to:

# 1 set the value of the vector
# 2 get the value of the vector
# 3 set the value of the inverse of the vector
# 4 get the value of the inverse of the vector



makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}