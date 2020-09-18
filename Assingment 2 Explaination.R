# Testing how R finds Inverse of a given Matrix 
testm = matrix(c(2,3,4,4,3,1,1,2,4), nrow = 3, ncol = 3, byrow = T)
solve(testm)

# Example code on Vector and Cache Vector mean
# The make vector function, creates a list which containes the functions we
#definded.
# Set function assing y as a value to x
# Get function prints out the value we assinged 
# setmean assing m to act as the function mean
# getmean prints out the mean if it is calculated 

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean(x)
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}
cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

aVector <- makeVector(1:10)
aVector$get()
aVector$getmean()
aVector$set(30:50)
cachemean(aVector)
aVector$getmean()
