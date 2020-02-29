## Put comments here that give an overall description of what your
## functions do

## j is the inverse of the matrix x, the function is exactly the same as the example of the vector with the mean.
## Simply replace m with j and then the mean with the inverse

makeCacheMatrix <- function(x = matrix()) {
    j <- NULL
    set <- function(y){
        x <<- y
        j <<- NULL
    }
    get <- function()x
    setInverse <- function(inverse) j <<- inverse
    getInverse <- function() j 
    list(set = set, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
}




## Here too the solution is very similar to the case of the vector, what has been changed is commented within the function

cacheSolve <- function(x, ...) {
    
    ## Return a matrix that is the inverse of 'x'
    j <- x$getInverse()
    if(!is.null(j)) {
        message("getting cached data")
        return(j)
    }
    # data will be the inverse matrix
    data <- x$get()
    
    # This generic function solves the equation a %*% x = b for x, where b can be either a vector or a matrix
    j <- solve(data, ...)
    x$setInverse(j)
    j
}
