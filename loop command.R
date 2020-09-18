# Looping Commands in R 
# Looping Commands in R allows you to execute a loops over a object, or a series 
# objects. While there are many loop functions, we will focus on the most common
# ones.

# 1. Lappy - allow you to loop over a list and evaluate a function on each 
#            individual element
#    lappy takes three arguments 
#    a) The object list X ( if x is not a list, it will be coerced to a list)
#    b) The function or its function name
#    c) Other arguments of the function you aim to pass on to x


# Som examples
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
lapply(x, mean)

x <- 1:4 
lapply(x, runif)

x <- 1:4  
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4,2,2), b = matrix(1:6,3,2))
x
# -- extrat the first coloum of the two matrixes in the list x
lapply(x, function(elt) elt[,1]) 
# -- Note this function does not exist outside of this line of code, it is a 
# annoymus function. We bascialy quickely defined it in the lapply

# 2. Sapply - allow you to do the same functionality as lapply but it simplies
#             the results of a typical lapply function

# Simplication Rlues
# a) If the result of lappy is a list, where every elment in length 1,it return
#    a vector instead
# b) If the result of lappy is a list where every element is the same length, it
#    returns it as a matric
# c) If sapply doesnt know what to do, it will return the same result as lapply

# For example
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
lapply(x, mean)
sapply(x,mean)



#3. Apply - apply is used to apply functions to a selective area, coloumns or
#           rows of an array

#   Apply takes similar arguments as lappy
#   1. An arrary/ matrix object
#   2. Margin : the area of the array objecy you wish to operate the function
#   3. Function : The function you wish to apply to the margin 
 
# For example
# -- Calculate the mean of each coloumn of a matrix
x <- matrix(rnorm(200), 20, 10)
# In here, the first dimension (margin) is the rows (20), and the second 
# dimension is the coloumns (10). What is not included is collapsed (ignored)
apply(x,2,mean)
apply(x,1,mean)
# For these col/row means and sum operations, R have creates optimised commands
# of apply to do these, here is the list
# -- Optimised Commands
# 1. rowsums = apply(x,1,sum)
# 2. rowmeans = apply(x,1,mean)
# 3. colsums = apply(x,2,sum)
# 4. colmeans = apply(x,2,mean)

# Another example
x <- matrix(rnorm(200), 20, 10)
apply(x,1,quantile, probs = c(0.25,0.75))

a <- array(rnorm(2 *2 * 10), c(2,2,10))
apply(a,c(1,2), mean)
rowMeansns(a,dims = 2)




#4. Mapply is a multiavtirate apply of sorts which applies a function in
#   parallel over a set of arguments
# This is useful, becasue the other apply fuctions only commands the fucntion
# in one list. Mapply can take multiple arguments from different lists and pass
# it on to a function

# Mapply takes the following argguments 
# 1. Function, the function needs to have at least enought arguments to the 
#    number of object you are trying to pass. For example, consider, if you are
#    passing 2 elements from 2 lists, you need to have both of these elements 
#    present in the function as an argument
# 2. MoreArgs: the list for other arguments to run
# 3. Simplify: indicates wether or not the results should be simplied, rlues are
#              similar to those in apply Vs lapply

# For example
# -- Suppoe you want to achieve the following list
x <- list(rep(1,4),rep(2,3), rep(3,2), rep(4,1))
x
y <- mapply(rep, 1:4,4:1)
y
identical(x,y)
# -- Suppose you want to create a noise funcion, and create 1 random variable
#    with mean 1, and 2 random variables with mean 2 and so on
# Step one: create the function
noise <- function(n,mean,sd){
  rnorm(n,mean,sd)
}
noise(1:5,1:5,2)
# -- Notice that simply calling the function didnt work, so we can use Mapply to
# help 
mapply(noise, 1:5, 1:5, 2)
list(noise(1,1,2), noise(2,2,2))





# tapply - used to apply a function over a subset of vectors, usually used to 
#          calculate summary statistics of a subset 
# Tapply have the following arguments 
# 1. X is the object vector 
# 2. Index is the factor level we are subsetting. It is a factor, that allow
#    Tapply to know how to subset and repeat the commands 

# For example
x <- c(rnorm(10), runif(10),rnorm(10,1))
f <- gl(3,10)
tapply(x,f,mean)
tapply(x,f,mean,simplify = F)
tapply(x,f,range)
