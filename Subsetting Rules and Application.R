# Subsetting and Selected questions from Week 1's quiz activity

#Importing data set for questions, setting up variables

data = read.csv("hw1_data.csv")
x = list(subject = c("a","b","c"), ConcEnv = c(1,4,3), Food = c("apples","oranges","pear"))
v = c(seq(from = 1, to = 10 ,by = 0.5))
y = matrix(1:9, nrow = 3, byrow = F)

# Subsetting Basics 

# Subsetting Lists

x[1]
x[[1]]
x[["subject"]]
x[[c(1,2)]]
x[[c(3,1)]]
x[[1]][[3]]

#Subsetting Vectors and Matricies 
#1. Vectors
v[1:2]
v[19]
v[-1]
v[!v<5]

# 2. Matrix 
y[1,1]
y[2,3]
y[1,]
y[,2]

# Subsetting Data Frames

data$Ozone[1:10]
data[1:10,1]

# Complex Subsetting

# 1. Multiple Conditions
# a) Using & AND |
m = c(1:8)
m [m >= 2 & m < 7]

c1 = m>=2 & m < 7
m[c1]

c2 = m == 2 | m ==5
m[c2]

mean(m)
mean(m[ m <= 4])
mean(m[m < 4 & m > 1])
mean(data$Temp)
mean(data$Temp[data$Temp > 60])
mean(data$Temp[data$Month == 5 & data$Temp > 60])

# b) Using double brakets when there are missing values 
mean(data$Ozone) ## This will return NA, as we have not discounted for the missing values
## To slove this problem we would use is.na () function
mean(data$Ozone[!is.na(data$Ozone)])
# Now suppose we want to set a conditinon or range we want to find the mean of 

mean(data$Ozone[!is.na(data$Ozone)][data$Month == 5])

#Suppose you want to find a mean, while R is able to sucessfully find the values, and put the rest as NA, you cant calculate the mean as such
# To do so, you need to set up a T & F statemnet that will make calculating mean easier 

# Suppose you are trying to find the mean of Solar. R when Ozone values are above 31, and Temp is above 90

True = data$Ozone > 31 & data$Temp > 90
data[True, "Solar.R"] #This step is to check whetehr or not there are NA values in this subset coloum we are interested in

#Since there are NA values, we have to tell R to ignore them when calculating the mean

mean(data[True, "Solar.R"][!is.na(data[True, "Solar.R"])])
# This is the Subsetting    This is to tell R to exculde the NA values in this subset

