## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  cachedinvmatrix <- NULL
  set <- function(newmatrix) {
    x <<- newmatrix
    invmatrix <<- NULL
  }
  get <- function() x
  setinverse <- function(invmatrix) cachedinvmatrix <<- invmatrix
  getinverse <- function() cachedinvmatrix
  
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## If the inverse of a matrix already exists, return the cached value
## Else calculate and return the inverse of a matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invretrieved <- x$getinverse()
  if(!is.null(invretrieved)){
    message("getting cached data")
    return(invretrieved)
  }
  origmatrix <- x$get()
  invmatrix <- solve(origmatrix)
  x$setinverse(invmatrix)
  invmatrix
}
