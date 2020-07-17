# Basic Functions
add_2 <- function(x,y){
  x+y
}
add_2(3,5)

above <- function(x,n){
  use <- x> n
  x[use]
}
x = 1:40

coloumnmean <- function(y, removeNA = TRUE){
  nc = ncol(y)
  means = numeric(nc)
  for(i in 1:nc){
    means[i] = mean(y[,i],na.rm = removeNA)
  }
  means
}
coloumnmean(airquality)

y = 10
f1 = function(x){
  y = 2
  y^2 + g(x)
}
g = function(x){
  x*y
}
f1(3)
 