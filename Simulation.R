# Simulations and Profilling 

# In most statistical analysis, you would need to simiulate the sitaution you
# you are modeling, and assess its statistical signifigance throgh assesing the
# the likelyhood of an event randomly occuring. This is simulation

# -- Simulation Functions
# For most statistical distirbutions, R provides 4 different functions
# -1. r## : generate random numbers based on the distribution
# -2. d## : evaluate the probability density at a point
# -3. p## : evaluate the cumulative distribution for any distribution
# -4. q## : generate quantile functions

# Normal Distrubuion
rnorm(n, mean = ,sd = )
dnorm(x = ,mean = ,sd = ,log = F)
pnorm(q = ,mean = ,sd = ,lower.tail = T,log.p = F)


# Binomial Distribution
rbinom(n = ,size = ,prob = )
dbinom(x = ,size = ,prob = ,log = F)
pbinom(q = ,size = ,prob = ,lower.tail = T,log.p = F)

# For example
# -1. Generating random normal varibales
x <- rnorm(100)
x <- rnorm(10,20,2) ## n = 10 (how many random numbers) mean = 20, sd = 2
set.seed(1)
x <- rnorm(5)
# - 2. Generating random possion variables
y <- rpois(10,1)  # n = 10, Lamda = 1
ppois(2,2) ## Pr(x <= 2, Lamda = 2)


## -- Simulation on Linear Model
## 1. X is a random variable
## Suppose we want to simulate from the following linear model
##           y = B_0 + Cx + d
## Where d in a random noise (~N(0,4)), x~N(0,1), B_0 = 0.5, C = 2
#  - Hint : create each part of the linear model first
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2 *x +e
summary(y)
plot(x,y)

## 2. X is a binary Variable
set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x+e
summary(y)
plot(x, y)

## Generating Rnadom Numbers from a generalised linear model
## - Assume that the outcome Y has a possion distribution, and Log(mu) = f + dx
## where f = 0.5, d = 0.3
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
## To find the Lamda (mean), we use the exp() function
y <- rpois(100,exp(log.mu))
summary(y)
plot(x,y)

## - Generating Random Samples
## Here we use the sample() function, which tells R to draw random samples from
## a vector of objects

set.seed(1)
x <- c(1:10)
sample(x)
sample(1:10,4)
