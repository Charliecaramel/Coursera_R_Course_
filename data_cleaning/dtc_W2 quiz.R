# Data-Cleaning Week 3 Quiz

# Question 2 and 3
library(readr)
library(RMySQL)
library(sqldf)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url, destfile = "./data_cleaning/week2quiz.csv")
acs <- read.csv("data_cleaning/week2quiz.csv")
# -- SQL command that will fetech data with pwgp1 and age less than 50
sqldf("select * from acs")



# Question 4
html <- "http://biostat.jhsph.edu/~jleek/contact.html"
htmlurl <- getURL(html)
code <- htmlTreeParse(htmlurl,useInternalNodes = T)
rootNode <- xmlRoot(code)
names(rootNode)

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
nchar(htmlCode[10])
nchar(htmlCode[20])

#Question 5 - loading fixed widith files

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url, destfile = "./data_cleaning/q5dat")
q5 <-read.fwf("data_cleaning/q5dat", widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4), sep = "\t",skip =)
# Since we want the sum, and currently all columns are in character class, we have to change that
q5[]<- lapply(q5, function(x) as.numeric(as.character(x)))
sum(q5[,c(4,9)])
