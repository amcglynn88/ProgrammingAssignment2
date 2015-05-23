## Sets functions to store & calculate values of matrix x and the inverse of matrix x
## The first function creates set & get functions for the matrix x and its inverse 
## (initially null if not calculated)

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
  x <<- y
  inv <<- NULL
}
get <- function() x
setinverse <- function(inverse) inv <<- inverse
getinverse <- function() inv
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function either retrieves the stored inverse matrix of x or if it doesn't exist
## then it calculates the inverse, stores, and returns it 

cacheSolve <- function(x, ...) {

inv <- x$getinverse()

## If the inv matrix is not null then return the message "getting cached data" and then
## return the inverse matrix
if(!is.null(inv)){
  message("getting cached data")
  return(inv)
}

## The ELSE part of the function with the calculation and storage of calculation
matrix.data <- x$get()

## This solves for the inverse of the matrix
inv <- solve(matrix.data,...)
x$setinverse(inv)
return(inv)
}