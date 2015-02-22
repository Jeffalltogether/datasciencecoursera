cacheSolve <- function(x, ...) {
        
# the following function calculates the inverse of the special "vector" created 
# with makeCacheMatrix. However, it first checks to see if the inverse has 
# already been calculated. If so, it gets the inverse from the cache and 
# skips the computation. Otherwise, it calculates the inverse of the data 
# and sets the value of the inverse in the cache via the Solve() function.
        
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}