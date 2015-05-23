## Sets functions to store & calculate values of matrix x and the inverse of matrix x
## Can retrieve at will outside of current environmment
## The first function sets the matrix x and its inverse

## initially sets x as a matrix
makeCacheMatrix <- function(x = matrix()) {
## initially defines inv (inverse) as a null value
  inv <- NULL
## Sets values
set <- function(y){
  x <<- y
  inv <<- NULL
}
## Retrieves value of x aka gets the data
get <- function() x
## Sets the object inverse where the inverse is inputted and then stored as inv
setinverse <- function(inverse) inv <<- inverse
## Retrieves the inverse matrix of x
getinverse <- function() inv
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Either retrieves the stored inverse matrix of x or then calculates the inverse and saves
## it 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
## Takes x and applies the getinverse function to get the inverse matrix stored (either null
## or a previously calculated value)
inv <- x$getinverse()
## If the inv matrix is not null then return the message "getting cached data" and then
## return the inverse matrix
if(!is.null(inv)){
  message("getting cached data")
  return(inv)
}
## The ELSE part of the function. This gets the retrieved value of x and saves in 
## local environment & other environment for later
matrix.data <- x$get()
## solves for the inverse of the matrix
inv <- solve(matrix.data,...)
## sets the solved value as the inverse matrix for later
x$setinverse(inv)
## returns the inverse matrix
return(inv)
}
