# Variable Manipulation and generating new variables

# Example used for notes, Baltimore city open data on Resutaurants in the city 
url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile = "./data_cleaning/restaurants.csv")
resdata <- read.csv("data_cleaning/restaurants.csv")

# Genering and Manipulating Data
# -- Often in the process of data cleaning, we would do the following variable 
#    manipulation 
# --- 1. Missing Indicators (recoding Missing Values to our specifications)
#     2. Cutting up Quantitative Variables 
#     3.  Applying Transforms 

# Typically, we create sequnces to index our data sets to allow subsetting easier

s1 <- seq(1,10, by = 2)
s1

s2 <- seq(1,10, length = 3);s2

x<- c(1,3,5,7,8,100);seq(along = x) # This tells R to assign Index to object x

# ------------------------------------------
# Subletting Variables to create new variables for analysis 
resdata$nearme <- resdata$neighborhood %in% c("Roland Park", "Homeland")
table(resdata$nearme)
df <- resdata[resdata$nearme, ]

#--------------------------------------------
# Creating Dummy Variables
# suppose you want to find all the restaurants near Roland Park or Homeland and gen
# a dummy variable based on this

# --M1 : Using ifelse() command
restnearme <- resdata$neighborhood %in% c("Roland Park", "Homeland")
table(restnearme)
resdata$nearme <- ifelse(resdata$neighborhood %in% c("Roland Park", "Homeland"),TRUE, FALSE)
#OR
resdata$nearme2 <- ifelse(resdata$neighborhood %in% c("Roland Park", "Homeland"),1, 0)
# Another Example
resdata$Zipwrong <- ifelse(resdata$zipCode <0, "yes", "no")
table(resdata$Zipwrong, resdata$zipCode <0)

# --M2: Using dummies package (similar to xi command in stata)
library(dummies)
dummy_matrix <- dummy(resdata$neighborhood, sep = "_")
colSums(dummy_matrix)

# --M3: Using if_else() from dplyr
library(dplyr)
dummy_vec <- if_else(condition = resdata$neighborhood %in% c("Roland Park", "Homeland"), true = "yes", false = "no" )


#-------------------------------------------
# Creating Categorial Variables from Quantitative columns 

# --- M1: cut() command
# - E1 : Creating categorial varibales based on Quantiles 
resdata$zipcat = cut(resdata$zipCode, breaks = quantile(resdata$zipCode))
table(resdata$zipcat)
# -E2 : suppose we want to reduce the categories of council districts from 14 to 8
resdata$councilcat <- resdata$councilDistrict
resdata$councilcat2 <- cut(resdata$councilDistrict, seq(1,14,2), na.rm =T, labels = c(1:6))
table(resdata$councilcat)

# --- M2: Hmisc package

library(Hmisc)
resdata$zipcat2 <- cut2(resdata$zipCode, g = 4)
table(resdata$zipcat2)

resdata$councilcat3 <- cut2(resdata$councilDistrict, cuts = c(1,2,4,6,8,10,12,14))
table(resdata$councilcat3)

#-------------------------------------------
# Creating Factor Varibles 
# note: cutting creates factors
# --- M1: using factor() command
resdata$zcf <- factor(resdata$zipCode)
class(resdata$zcf)

yesno <- sample(c("yes","no"), size = 10, replace = T)
yesnofac <- factor(yesno,levels = c("yes", "no"))
relevel(yesnofac, ref = "yes")
as.numeric(yesnofac)

# --- M2 : plyr package
library(plyr)
resdata2 = mutate(resdata, zipGroups = cut2(zipCode, g=4))
table(resdata2$zipGroups)

