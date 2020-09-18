# Creating makeCacheMatrix function

# There are two objects that we need to initalise
# 1. The matrix we are tyring to  (x)
# 2. The inverse martix  (inv)

makeCacheMatrix <- function(x = matrix()){
  inv = matrix()
  set <- function(y){
    x <<- y
    inv <<- matrix()
  }
  get <- function()x
  setinv <- function(solve) inv <<- solve
  getinv <- function()inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

cacheSolve <- function(x, ...){
  inv <- x$getinv()
  if(!is.na(inv)){
    message("getting cached data")
    return(inv)
  }
  matrix <- x$get()
  inv <- solve(matrix,...)
  x$setinv(inv)
  inv
}

test <- makeCacheMatrix(matrix(c(7,3,6,0), nrow = 2))
test$get()
test$getinv()
test$set(matrix(c(7,3,6,0), nrow = 2))
cacheSolve(test)
test$getinv()
