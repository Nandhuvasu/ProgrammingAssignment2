## Put comments here that give an overall description of what your
## functions do

## This function creates the matrix for cacheing the inverse
## The fuction can set or get the matrix
## the function can also set the inverse in cache and get it

makeCacheMatrix <- function(x = matrix()) {
  invert_matrix<-NULL
  set<-function(y,a,b){
    x<<-matrix(y,a,b)
    invert_matrix<-NULL
  }
  get<- function() x
  setinverse<- function(inverse) invert_matrix<-inverse
  getinverse<- function() invert_matrix
  list(set = set,get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## This function computes the inverse of the matrix from above function
##it checks if the inverse already exists in cache
## if it exists in cache, it retrieves the available information
## Or computes the new inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invert_matrix<-x$getinverse()
  if(!is.null(invert_matrix)){
    message("getting cached data")
    return (invert_matrix)
  }
  data <- x$get()
  invert_data <- solve(data,...)
  x$setinverse(invert_data)
  invert_data
  
}
