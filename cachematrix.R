## A pair of functions which demonstrates the usage of the <<- operator to an object in an environment which is different to the current environment.
## The following functions are used to create a special objec that stores a numeric matrix and caches its mean.

## Creates a special "matrix", which is really a list containing set and get the value of the matrix and then set and get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<- NULL
  
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  setinv <- function(inv) m <<- inv
  
  getinv <- function() m
  
  list(set=set, get=get,setinv=setinv,getinv=getinv)
}


## The following function calculates the inverse of the special matrix.
## However, first checks to see if it's already been calculated, if so, skips the calc and returns the cached value.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)){
      ## Return the cached value of the inverse
      message("getting cached data")
      return(m)
    }
  ## Calculate inverse
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m      
}
