# The str function in R
# Str function will compactly display the structure of an R object. It is great
# for us to inspect an object, and in particular lists. 
# Typically it will only display one line of output

str(str)
str(lm)
str(mean)

x <- rnorm(100,2,4)
summary(x)
str(x)

f1 <- gl(40,10)
str(f1)
summary(f1)

library(datasets)
head(airquality)
str(airquality)
summary(airquality)

m <- matrix(rnorm(100),10,10)
m
str(m)

s <- split(airquality, airquality$Month)
str(s)

sapply(airquality,class)

