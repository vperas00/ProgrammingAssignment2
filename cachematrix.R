# The makeCacheMatrix function creates a list containing a function that:
# - sets the value of the matrix
# - gets the value of the matrix
# - sets the value of inverse of the matrix
# - gets the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

# The cacheSolve function returns the inverse of the matrix. It starts by checking if
# the inverse has already been computed. In that case, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache using the setinverse function.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.") #confirms that data used is in cache
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}


