# Cleaning Data - W1 QUiz
library(readxl)
library(openxlsx)
library(tibble)
library(XMLL)
# Question 1
xlurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
q1dat <- read.csv(xlurl)
q1dat <- data.table(q1dat)
class(q1dat)
q1dat[, .N, by =VAL]
mean(q1dat$VAL[q1dat$VAL == 24], na.rm = TRUE)

# Quetsion 3
xlsxurl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
colIndex <- 7:15
rowIndex <- 18:23
q3dat <- read.xlsx(xlsxurl, rows = rowIndex, cols = colIndex)
sum(q3dat$Zip*q3dat$Ext,na.rm=T)

# Question 4
xmlurl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc = xmlParse(xmlurl, useInternalNodes = T)

# Question 5
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileurl, destfile = "./data_cleaning/q4dat.csv", method = "curl")
list.files("./data_cleaning")
DT = fread("data_cleaning/q4dat.csv")
pwgtp15
