# data.tables package

dat = data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3),z = rnorm(9))
data = data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3),z = rnorm(9))
head(dat)
head(data)

# See all the data tables in memeory
tables()

# Subsetting

data[2,]
data[,2]
data[data$y="a",]
data[c(2,3)]

{
  x = 1
  y = 2
}
k = {print(10);5}
print(k)

data[,list(mean(x),sum(z))]
data[,table(y)]
data[, n := rnorm(9) * 2] # Creating new coloumn (similar to gen command on Stata)
data[, m := {tmp <- (x+z); log2(tmp+5)}]
data[, a :=x>0] # Binanry variable creation

# Special Vairble .N
# Counting 
set.seed(123)
dat2 <- data.table(x = sample(letters[1:3], 1E5, TRUE))
dat2[,.N,by = x]
dat2[,table(dat2$x)]


# Keys in Data Tables
# Key in data tables are

DT <- data.table(x = rep(c("a","b","c"), each = 1000), y = rnorm(300))
setkey(DT,x)                 
DT['a']

DT1 = data.table(x = c("a","a","b","from1"), y = 1:4)
DT2 = data.table(x = c("a","b","from2"), z = 5:7)
setkey(DT1,x)
setkey(DT2,x)
merge(DT1,DT2)
