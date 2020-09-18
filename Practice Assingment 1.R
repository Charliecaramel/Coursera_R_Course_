# Downloading the data for Practice Assingmnet 1

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")
list.files("diet_data")
andy = read.csv("diet_data/Andy.csv")
david = read.csv("diet_data/David.csv")
john = read.csv("diet_data/John.csv")
mike = read.csv("diet_data/Mike.csv")
steve = read.csv("diet_data/Steve.csv")

# Basic Information about the data sets we are loading in

head(andy)
colnames(andy)
is.na(andy$Weight)
mean(andy$Weight)
max(andy$Day)

# From this we can know that, for the experiment trail fo 30 days, the average
# weight of andy is 137.333

# Basic Subsetting opertations
summary(andy$Weight)
andy[1, "Weight"]
andy[which(andy$Day == 30), "Weight"]
subset(andy$Weight, andy$Day == 25:30) 
# the longer object have to multiple of
# the shorter object to allow subsetting a range

# Basic Analysis
# - How much weright has Andy Lost?
Andy_loss = andy[1,"Weight"] - andy[30, "Weight"]

# - Can we find out the information for the others in a more efficient way?
list.files("diet_data")
# We know that this will return a vector of strings, file names
# we can use this to allow us to access files more effciently
files = list.files("diet_data")
files[1]
files[2:3]

read.csv(files[2])
# Note that this will return an error, because the file is not in our directory
# it is in its sub-folder, and we need to tell R this
# To fix this problem, we ask R to also remember the path of the file, thus use
# the argument, full.name = TRUE
files = list.files("diet_data",full.name = TRUE)
david = read.csv(files[2])

# - Combine everyones weight loss into one table (Hint = rbind)
# first lets try it with one pair

andy_david = rbind(andy,david)
day_25 = andy_david[andy_david$Day == 25, ]

#Now lets try to create a big data set with everyones values in
data = data.frame()
for (i in 1:5){
  data = rbind(data, read.csv(files[i]))
}
View(data)
str(data)

for (i in 1:5){
  data_2 = data.frame()
  data_2 = rbind(data_2, read.csv(files[i]))
}
# Notice how this one, by defining the data frame inside the for loop, it is
# essentially reset after each addition of the for loop, thus only stored the
# last itteration fo the files, Steves's data

# data analysis of data set

median(data$Weight)
is.na(data$Weight)
# since there are missing values, we have to tell R to ignore them, there are
# 2 ways of achieving this
median(data$Weight, na.rm = TRUE)
median(data$Weight[!is.na(data$Weight)])

# - What is the median weight of all participants on Day 30?

median(data$Weight[data$Day == 30])
# OR
day_30 = data[which(data$Day == 30), ]
median(day_30$Weight)

# - Build a function that will output the median weight of any given date
Median_W = function(dataset, day){
  files = list.files(dataset, full.names = TRUE)
  base = data.frame()
  for(i in 1:5){
    base = rbind(base, read.csv(files[i]))
  }
  subset = base[which(base[ , "Day"] == day), ]
  median(subset[, "Weight"], na.rm = TRUE)
}
Median_W(dataset = "diet_data", day = 30)
